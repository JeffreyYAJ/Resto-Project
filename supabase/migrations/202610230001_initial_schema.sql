CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TYPE user_role AS ENUM ('customer', 'restaurant_admin', 'driver', 'admin');
CREATE TYPE order_status AS ENUM (
    'pending_restaurant',
    'confirmed',
    'refused',
    'searching_driver',
    'assigned',
    'in_delivery',
    'delivered',
    'cancelled',
    'awaiting_customer_response'
);
CREATE TYPE delivery_status AS ENUM ('pending', 'assigned', 'in_delivery', 'delivered', 'problem', 'cancelled');
CREATE TYPE payment_status AS ENUM ('pending_verification', 'verified', 'rejected', 'cancelled', 'paid');
CREATE TYPE payment_method AS ENUM ('cash', 'orange_money', 'mtn_momo');
CREATE TYPE refund_status AS ENUM ('to_refund', 'refunded', 'rejected');
CREATE TYPE settlement_status AS ENUM ('pending', 'calculated', 'paid', 'cancelled');
CREATE TYPE notification_channel AS ENUM ('in_app', 'whatsapp', 'push');
CREATE TYPE alert_status AS ENUM ('open', 'resolved');

CREATE TABLE profiles (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    role user_role NOT NULL,
    email text NOT NULL UNIQUE,
    is_active boolean NOT NULL DEFAULT true,
    is_suspended boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE customers (
    customer_id uuid PRIMARY KEY REFERENCES profiles(id) ON DELETE CASCADE,
    first_name text NOT NULL,
    last_name text NOT NULL,
    whatsapp_phone text NOT NULL UNIQUE,
    customer_identifier text NOT NULL UNIQUE,
    password_hash text NOT NULL,
    is_blocked boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT customer_identifier_format CHECK (customer_identifier ~ '^[0-9][A-Z][0-9]{2}$')
);

CREATE TABLE restaurants (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name text NOT NULL,
    slug text NOT NULL UNIQUE,
    status text NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'paused', 'suspended')),
    contact_phone text,
    address text,
    delivery_zone text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE restaurant_admins (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id uuid NOT NULL UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,
    restaurant_id uuid NOT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
    is_primary boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE drivers (
    driver_id uuid PRIMARY KEY REFERENCES profiles(id) ON DELETE CASCADE,
    first_name text NOT NULL,
    last_name text NOT NULL,
    phone text NOT NULL UNIQUE,
    is_active boolean NOT NULL DEFAULT true,
    is_available boolean NOT NULL DEFAULT true,
    has_active_delivery boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE dishes (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    restaurant_id uuid NOT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
    name text NOT NULL,
    description text,
    category text,
    is_available boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE daily_menu_items (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    dish_id uuid NOT NULL REFERENCES dishes(id) ON DELETE CASCADE,
    restaurant_id uuid NOT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
    menu_date date NOT NULL,
    unit_price integer NOT NULL CHECK (unit_price >= 0),
    is_available boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    UNIQUE (dish_id, menu_date)
);

CREATE TABLE price_history (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    menu_item_id uuid NOT NULL REFERENCES daily_menu_items(id) ON DELETE CASCADE,
    previous_price integer NOT NULL CHECK (previous_price >= 0),
    new_price integer NOT NULL CHECK (new_price >= 0),
    changed_by uuid REFERENCES profiles(id),
    changed_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE orders (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id uuid NOT NULL REFERENCES customers(customer_id) ON DELETE RESTRICT,
    restaurant_id uuid NOT NULL REFERENCES restaurants(id) ON DELETE RESTRICT,
    status order_status NOT NULL DEFAULT 'pending_restaurant',
    payment_status payment_status NOT NULL DEFAULT 'pending_verification',
    payment_method payment_method NOT NULL DEFAULT 'cash',
    subtotal integer NOT NULL CHECK (subtotal >= 0),
    delivery_fee integer NOT NULL CHECK (delivery_fee >= 0),
    commission_rate integer NOT NULL DEFAULT 0 CHECK (commission_rate >= 0 AND commission_rate <= 100),
    total_amount integer NOT NULL CHECK (total_amount >= 0),
    delivery_address text NOT NULL,
    delivery_building text,
    delivery_room text,
    delivery_landmark text,
    delivery_instructions text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    confirmed_at timestamptz,
    delivered_at timestamptz,
    cancelled_at timestamptz,
    cancel_reason text
);

CREATE TABLE order_items (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id uuid NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    dish_id uuid REFERENCES dishes(id),
    dish_name text NOT NULL,
    unit_price integer NOT NULL CHECK (unit_price >= 0),
    quantity integer NOT NULL CHECK (quantity > 0),
    total_price integer NOT NULL CHECK (total_price >= 0),
    delivery_fee_snapshot integer NOT NULL DEFAULT 0 CHECK (delivery_fee_snapshot >= 0),
    commission_rate_snapshot integer NOT NULL DEFAULT 0 CHECK (commission_rate_snapshot >= 0 AND commission_rate_snapshot <= 100),
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE order_status_transition_rules (
    from_status order_status NOT NULL,
    to_status order_status NOT NULL,
    actor_role user_role,
    PRIMARY KEY (from_status, to_status)
);

CREATE TABLE order_status_history (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id uuid NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    old_status order_status,
    new_status order_status NOT NULL,
    actor text NOT NULL,
    reason text,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE order_modifications (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id uuid NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    proposed_by uuid NOT NULL REFERENCES profiles(id) ON DELETE RESTRICT,
    proposed_change jsonb NOT NULL,
    response_status text NOT NULL DEFAULT 'pending' CHECK (response_status IN ('pending', 'accepted', 'rejected', 'expired')),
    responded_by uuid REFERENCES profiles(id),
    responded_at timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE deliveries (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id uuid NOT NULL UNIQUE REFERENCES orders(id) ON DELETE CASCADE,
    driver_id uuid REFERENCES drivers(driver_id) ON DELETE SET NULL,
    status delivery_status NOT NULL DEFAULT 'pending',
    accepted_at timestamptz,
    started_at timestamptz,
    delivered_at timestamptz,
    problem_reason text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX ux_active_delivery_per_driver
ON deliveries (driver_id)
WHERE status IN ('assigned', 'in_delivery');

CREATE TABLE delivery_attempts (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    delivery_id uuid NOT NULL REFERENCES deliveries(id) ON DELETE CASCADE,
    driver_id uuid NOT NULL REFERENCES drivers(driver_id) ON DELETE RESTRICT,
    attempt_number integer NOT NULL CHECK (attempt_number > 0),
    status text NOT NULL CHECK (status IN ('offered', 'accepted', 'rejected', 'problem')),
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE delivery_codes (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    delivery_id uuid NOT NULL UNIQUE REFERENCES deliveries(id) ON DELETE CASCADE,
    code_hash text NOT NULL UNIQUE,
    attempts_count integer NOT NULL DEFAULT 0 CHECK (attempts_count >= 0),
    max_attempts integer NOT NULL DEFAULT 5 CHECK (max_attempts > 0),
    expires_at timestamptz NOT NULL,
    used_at timestamptz,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE payments (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id uuid NOT NULL UNIQUE REFERENCES orders(id) ON DELETE CASCADE,
    method payment_method NOT NULL,
    amount integer NOT NULL CHECK (amount >= 0),
    status payment_status NOT NULL DEFAULT 'pending_verification',
    external_reference text,
    verified_by uuid REFERENCES profiles(id),
    verified_at timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE payment_verifications (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    payment_id uuid NOT NULL UNIQUE REFERENCES payments(id) ON DELETE CASCADE,
    verified_by uuid NOT NULL REFERENCES profiles(id) ON DELETE RESTRICT,
    reference_number text NOT NULL,
    operator_name text NOT NULL,
    confirmation_code text,
    details jsonb,
    confirmed_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE refunds (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id uuid NOT NULL UNIQUE REFERENCES orders(id) ON DELETE CASCADE,
    status refund_status NOT NULL DEFAULT 'to_refund',
    amount integer NOT NULL CHECK (amount >= 0),
    reason text,
    created_at timestamptz NOT NULL DEFAULT now(),
    processed_at timestamptz
);

CREATE TABLE ledger_entries (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    entry_type text NOT NULL CHECK (entry_type IN ('order_sale', 'platform_commission', 'driver_earning', 'refund', 'settlement', 'cash_remittance', 'adjustment')),
    amount integer NOT NULL CHECK (amount >= 0),
    order_id uuid REFERENCES orders(id),
    actor_id uuid REFERENCES profiles(id),
    idempotency_key text NOT NULL UNIQUE,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE settlements (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    restaurant_id uuid REFERENCES restaurants(id),
    driver_id uuid REFERENCES drivers(driver_id),
    period_start timestamptz NOT NULL,
    period_end timestamptz NOT NULL,
    gross_amount integer NOT NULL CHECK (gross_amount >= 0),
    platform_fee integer NOT NULL CHECK (platform_fee >= 0),
    net_amount integer NOT NULL CHECK (net_amount >= 0),
    status settlement_status NOT NULL DEFAULT 'pending',
    created_at timestamptz NOT NULL DEFAULT now(),
    paid_at timestamptz
);

CREATE TABLE cash_remittances (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    driver_id uuid NOT NULL REFERENCES drivers(driver_id) ON DELETE CASCADE,
    order_id uuid NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    amount_expected integer NOT NULL CHECK (amount_expected >= 0),
    amount_received integer NOT NULL DEFAULT 0 CHECK (amount_received >= 0),
    amount_reversed integer NOT NULL DEFAULT 0 CHECK (amount_reversed >= 0),
    difference integer NOT NULL DEFAULT 0,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE notifications (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    channel notification_channel NOT NULL,
    title text NOT NULL,
    message text NOT NULL,
    is_read boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE alerts (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    alert_type text NOT NULL,
    status alert_status NOT NULL DEFAULT 'open',
    message text NOT NULL,
    related_order_id uuid REFERENCES orders(id),
    created_by uuid REFERENCES profiles(id),
    resolved_by uuid REFERENCES profiles(id),
    resolved_at timestamptz,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE audit_log (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    action text NOT NULL,
    actor_type text NOT NULL,
    actor_id uuid,
    target_type text,
    target_id uuid,
    details jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE settings (
    key text PRIMARY KEY,
    value jsonb NOT NULL,
    updated_by uuid REFERENCES profiles(id),
    updated_at timestamptz NOT NULL DEFAULT now()
);

INSERT INTO settings (key, value, updated_by)
VALUES
    ('delivery_fee', '{"amount": 2500}', NULL),
    ('platform_commission_rate', '{"rate": 10}', NULL),
    ('support_whatsapp_number', '{"number": "+237000000000"}', NULL),
    ('restaurant_confirmation_delay_minutes', '{"value": 15}', NULL),
    ('customer_modification_response_minutes', '{"value": 30}', NULL),
    ('driver_search_retry_count', '{"value": 3}', NULL),
    ('driver_search_retry_delay_minutes', '{"value": 5}', NULL),
    ('verification_code_max_attempts', '{"value": 5}', NULL),
    ('delivery_code_max_attempts', '{"value": 5}', NULL),
    ('maintenance_mode', '{"enabled": false}', NULL);

CREATE TABLE verification_codes (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    profile_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
    purpose text NOT NULL,
    code_hash text NOT NULL,
    expires_at timestamptz NOT NULL,
    used_at timestamptz,
    attempts_count integer NOT NULL DEFAULT 0 CHECK (attempts_count >= 0),
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE order_status_history_rejections (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    order_status_history_id uuid NOT NULL UNIQUE REFERENCES order_status_history(id) ON DELETE CASCADE,
    rejection_reason text NOT NULL
);

CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS trigger AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_profiles_updated_at
BEFORE UPDATE ON profiles FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_customers_updated_at
BEFORE UPDATE ON customers FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_restaurants_updated_at
BEFORE UPDATE ON restaurants FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_restaurant_admins_updated_at
BEFORE UPDATE ON restaurant_admins FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_drivers_updated_at
BEFORE UPDATE ON drivers FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_dishes_updated_at
BEFORE UPDATE ON dishes FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_daily_menu_items_updated_at
BEFORE UPDATE ON daily_menu_items FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_orders_updated_at
BEFORE UPDATE ON orders FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_order_modifications_updated_at
BEFORE UPDATE ON order_modifications FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_deliveries_updated_at
BEFORE UPDATE ON deliveries FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_payments_updated_at
BEFORE UPDATE ON payments FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_cash_remittances_updated_at
BEFORE UPDATE ON cash_remittances FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TRIGGER trg_settings_updated_at
BEFORE UPDATE ON settings FOR EACH ROW EXECUTE FUNCTION set_updated_at();

INSERT INTO order_status_transition_rules (from_status, to_status, actor_role)
VALUES
    ('pending_restaurant', 'confirmed', 'restaurant_admin'),
    ('pending_restaurant', 'refused', 'restaurant_admin'),
    ('pending_restaurant', 'cancelled', 'customer'),
    ('confirmed', 'searching_driver', 'admin'),
    ('confirmed', 'cancelled', 'admin'),
    ('searching_driver', 'assigned', 'admin'),
    ('searching_driver', 'cancelled', 'customer'),
    ('assigned', 'in_delivery', 'driver'),
    ('assigned', 'searching_driver', 'driver'),
    ('in_delivery', 'delivered', 'driver'),
    ('in_delivery', 'awaiting_customer_response', 'driver'),
    ('in_delivery', 'cancelled', 'admin'),
    ('awaiting_customer_response', 'delivered', 'customer'),
    ('awaiting_customer_response', 'cancelled', 'customer');

CREATE OR REPLACE FUNCTION transition_order(
    p_order_id uuid,
    p_new_status order_status,
    p_actor text,
    p_reason text DEFAULT NULL
)
RETURNS order_status
LANGUAGE plpgsql
AS $$
DECLARE
    v_current_status order_status;
BEGIN
    SELECT status INTO v_current_status
    FROM orders
    WHERE id = p_order_id
    FOR UPDATE;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Order % not found', p_order_id;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM order_status_transition_rules
        WHERE from_status = v_current_status
          AND to_status = p_new_status
    ) THEN
        RAISE EXCEPTION 'Invalid transition from % to %', v_current_status, p_new_status;
    END IF;

    UPDATE orders
    SET status = p_new_status,
        updated_at = now()
    WHERE id = p_order_id;

    INSERT INTO order_status_history (order_id, old_status, new_status, actor, reason)
    VALUES (p_order_id, v_current_status, p_new_status, p_actor, p_reason);

    RETURN p_new_status;
END;
$$;

CREATE OR REPLACE FUNCTION prevent_write_on_append_only()
RETURNS trigger AS $$
BEGIN
    RAISE EXCEPTION 'This table is append-only and cannot be updated or deleted through the application.';
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_ledger_entries_no_write
BEFORE UPDATE OR DELETE ON ledger_entries
FOR EACH ROW EXECUTE FUNCTION prevent_write_on_append_only();

CREATE TRIGGER trg_audit_log_no_write
BEFORE UPDATE OR DELETE ON audit_log
FOR EACH ROW EXECUTE FUNCTION prevent_write_on_append_only();

CREATE OR REPLACE FUNCTION validate_customer_identifier()
RETURNS trigger AS $$
BEGIN
    IF NEW.customer_identifier !~ '^[0-9][A-Z][0-9]{2}$' THEN
        RAISE EXCEPTION 'Customer identifier must match pattern 3A17';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validate_customer_identifier
BEFORE INSERT OR UPDATE ON customers
FOR EACH ROW EXECUTE FUNCTION validate_customer_identifier();

CREATE OR REPLACE FUNCTION validate_mobile_payment_reference()
RETURNS trigger AS $$
BEGIN
    IF NEW.method IN ('orange_money', 'mtn_momo') AND (NEW.external_reference IS NULL OR NEW.external_reference = '') THEN
        RAISE EXCEPTION 'Mobile payment requires a transaction reference';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validate_mobile_payment_reference
BEFORE INSERT OR UPDATE ON payments
FOR EACH ROW EXECUTE FUNCTION validate_mobile_payment_reference();
