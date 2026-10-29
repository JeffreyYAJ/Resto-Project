---
name: Campus Ngoa-Ekélé Dining
colors:
  surface: '#fff8f5'
  surface-dim: '#e0d8d5'
  surface-bright: '#fff8f5'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#faf2ee'
  surface-container: '#f4ece8'
  surface-container-high: '#eee7e3'
  surface-container-highest: '#e9e1dd'
  on-surface: '#1e1b19'
  on-surface-variant: '#404942'
  inverse-surface: '#33302d'
  inverse-on-surface: '#f7efeb'
  outline: '#707971'
  outline-variant: '#c0c9c0'
  surface-tint: '#2d6a48'
  primary: '#003820'
  on-primary: '#ffffff'
  primary-container: '#0f5132'
  on-primary-container: '#84c39b'
  inverse-primary: '#95d4ac'
  secondary: '#a73a00'
  on-secondary: '#ffffff'
  secondary-container: '#fd651e'
  on-secondary-container: '#571a00'
  tertiary: '#4d2600'
  on-tertiary: '#ffffff'
  tertiary-container: '#6e3900'
  on-tertiary-container: '#ff9e47'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#b0f1c7'
  primary-fixed-dim: '#95d4ac'
  on-primary-fixed: '#002111'
  on-primary-fixed-variant: '#0f5132'
  secondary-fixed: '#ffdbce'
  secondary-fixed-dim: '#ffb599'
  on-secondary-fixed: '#370e00'
  on-secondary-fixed-variant: '#7f2b00'
  tertiary-fixed: '#ffdcc3'
  tertiary-fixed-dim: '#ffb77d'
  on-tertiary-fixed: '#2f1500'
  on-tertiary-fixed-variant: '#6e3900'
  background: '#fff8f5'
  on-background: '#1e1b19'
  surface-variant: '#e9e1dd'
typography:
  headline-xl:
    fontFamily: Plus Jakarta Sans
    fontSize: 32px
    fontWeight: '800'
    lineHeight: 38px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 26px
    fontWeight: '700'
    lineHeight: 32px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 20px
    fontWeight: '700'
    lineHeight: 26px
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '500'
    lineHeight: 24px
  body-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
  label-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 15px
    fontWeight: '700'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 13px
    fontWeight: '600'
    lineHeight: 18px
  label-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 11px
    fontWeight: '700'
    lineHeight: 14px
    letterSpacing: 0.04em
  currency-display:
    fontFamily: Plus Jakarta Sans
    fontSize: 18px
    fontWeight: '800'
    lineHeight: 22px
    letterSpacing: -0.02em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  margin: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

This design system addresses the lived realities of students and staff at the University of Yaoundé I: bustling campus courtyards, bright equatorial sunlight, varying network reliability, and budget-friendly Android smartphones. The brand personality balances collegiate reliability with vibrant, appetizing warmth inspired by Cameroonian gastronomy and campus culture.

### Visual Style
The design system adopts a **High-Contrast Pragmatic / Tactile Modern** style. It bypasses heavy blur effects, complex skeuomorphic renders, and CPU-intensive animations to ensure immediate paint times and butter-smooth scrolling on mid-to-low-tier hardware. Depth is achieved via crisp borders, distinct tonal step-ups, and clear physical tap affordances. 

### Key Design Principles
- **Direct Sunlight Resilience:** Surfaces prioritize high optical contrast (exceeding WCAG AAA for vital reading flows) with rich ink values over soft pastels to eliminate glare fatigue.
- **One-Handed Ergonomics (Thumb-Zone Priority):** Primary interactive elements (navigation, tray triggers, confirmation buttons) sit strictly within the lower 45% screen zone (360px–390px base viewport).
- **Physical Consequence & Clarity:** Ordering food under unstable connectivity requires decisive visual feedback—instant state confirmations, clear transaction badges, and unmistakable error remedies.

## Colors

The palette grounds itself in deep academic campus foliage and fiery street-food spice tones, calibrated against sun-proof warm-white canvases.

### Palette Architecture
- **Primary (`#0F5132` - Campus Deep Forest):** Symbolizes the academic institution, trust, and freshness. Used for master app bars, primary brand markers, active navigation nodes, and trust stamps.
- **Secondary (`#EA580C` - Terracotta Piment):** High-energy, appetite-stimulating call-to-action color. Reserved strictly for primary action buttons ("Commander", "Valider le panier"), active cart counter chips, and critical progress alerts.
- **Tertiary (`#D97706` - Ndolé Gold):** Warm, supportive amber for meal preparation phases, pending mobile money validation, and high-visibility star ratings.
- **Neutral Dark (`#1C1917` - Stone Ink):** High-density dark charcoal for primary copy and structural outlines, retaining maximum legibility under outdoor ambient sunlight compared to standard soft grays.
- **Surface Canvas (`#FAFAF9` - Warm Chalk):** An off-white, anti-glare background layer that reduces eye strain while preventing the wash-out effect seen with pure blue-white tones outdoors.
- **Surface Highlight (`#FFFFFF` - Pure White):** Reserved for elevated cards, active trays, and input containers to establish instant layer separation against the warm canvas.
- **Feedback Semantics:**
  - Success: `#15803D` (Completed order / Cash received)
  - Warning: `#B45309` (Kitchen closing soon / Limited portions)
  - Critical/Error: `#B91C1C` (Payment failed / Out of stock)

## Typography

This design system uses a single geometric-humanist typeface—**Plus Jakarta Sans**—across headlines, body, and UI labels. Using a single font family minimizes network payload on 3G/EDGE campus data connections while preserving geometric clarity and large x-heights suited for outdoor readability.

### Rules of Typesetting
- **No Light Weights:** To guard against low-pixel-density rendering on entry-level Android panels, font weights below `400` are banned. Body text defaults to `500` in critical transaction cards.
- **FCFA Numerical Prominence:** Prices represent primary decision anchors. Use `currency-display` with tabular numbers (`tnum`) so costs align vertically across food lists and checkout tallies.
- **Headings Outdoor Fallback:** All headings apply tight letter tracking (`-0.01em` to `-0.02em`) to eliminate loose, washed-out silhouettes under intense daylight.

## Layout & Spacing

Layouts are anchored to a base 4px metric grid with an 8px structural step. The standard canvas target is a 360px–390px mobile viewport conforming to low-cost Android displays.

### Layout Mechanics
- **Mobile Fluid Column Grid:** Single-column flow with `1rem` (16px) outer margin and `1rem` gutter. Full horizontal spans are favored over multi-column grids to maintain large, mistake-proof target zones.
- **Thumb Reachability Anchor:** The viewport dedicates the bottom 80px (above OS home indicators) to fixed utility bars (Cart CTA, Quick Menu Filters, Total Price sticky bar).
- **Desktop/Tablet Breakpoints:**
  - `Mobile (< 640px)`: Full-width stacked modules; floating bottom checkout drawer.
  - `Tablet / Desktop (>= 640px)`: Max-width shell locked at 480px centered, preserving the rapid mobile app posture on larger devices without awkward canvas dilution.

## Elevation & Depth

To avoid rendering bottlenecks and fuzzy visibility under bright sun, this design system minimizes heavy drop shadows. Depth is achieved via **Tonal Layering with Crisp Structural Outlines**.

### Elevation Scale
- **Level 0 (Base Canvas):** `#FAFAF9` with no border or shadow.
- **Level 1 (Card & Section Containers):** `#FFFFFF` surface with a continuous 1px solid border in `#E7E5E4` (Stone 200). Shadow is a crisp, low-spread drop: `0px 1px 3px rgba(28, 25, 23, 0.08)`.
- **Level 2 (Active Dropdowns & Interactive Cards):** `#FFFFFF` surface, 1px solid `#D6D3D1` (Stone 300), paired with `0px 4px 8px rgba(28, 25, 23, 0.12)`.
- **Level 3 (Bottom Sheets & Modals):** `#FFFFFF` surface resting over a 45% black wash (`rgba(0, 0, 0, 0.45)`). Top outline: 1px solid `#E7E5E4`. Shadow: `0px -4px 16px rgba(28, 25, 23, 0.16)`.
- **Level 4 (Sticky Primary CTAs):** High-contrast vibrant `#EA580C` surface elevated with an intentional offset accent shadow: `0px 4px 0px #9A3412` to visually confirm physical push-depth.

## Shapes

The shape system employs roundedness scale `2` (medium-soft architecture):
- Standard controls (Buttons, inputs, menu list cells) use **8px (`0.5rem`)**.
- Content cards and modal wrappers use **16px (`1rem`)**.
- Bottom sheet drawer tops use **24px (`1.5rem`)** on top-left and top-right corners.
- Badges, status pills, and numeric counters use full capsules (**9999px / pill**).

This geometric softness delivers a modern mobile feel while retaining well-defined boundaries that delineate distinct touch zones.

## Components

### 1. Buttons
- **Touch Targets:** Minimum height of **48px** (optimal: 52px for primary actions). Full horizontal width on mobile checkout flows.
- **Primary CTA:** Background `#EA580C`, text `#FFFFFF`, bold `label-lg`. Active tap state applies a `scale(0.98)` transform and shifts color to `#C2410C`.
- **Secondary Action:** Background `#0F5132`, text `#FFFFFF`, 48px height.
- **Tertiary / Outline:** Background `#FFFFFF`, 1.5px border `#0F5132`, text `#0F5132`.
- **Disabled State:** Background `#E7E5E4`, text `#A8A29E`, 0px elevation, null pointers.

### 2. Dish & Restaurant Cards
- Structured horizontally for rapid vertical scanning: meal thumbnail (72x72px or 84x84px) pinned to the left; title, dietary indicator, and portion badge in the center; bold FCFA price and direct "+ Ajouter" tap trigger pinned to the bottom right.
- Container: `#FFFFFF` fill, 1px `#E7E5E4` border, 8px padding, 12px corner radius.

### 3. Chips & Category Filters
- Horizontally scrollable row with snap alignment.
- **Inactive:** `#FFFFFF` background, 1px `#D6D3D1` border, `#44403C` text, 36px height, pill radius.
- **Active:** `#0F5132` background, 0px border, `#FFFFFF` text, bold `label-md`.

### 4. Input Fields (Search, Phone Number, Delivery Drop-off)
- Height: 50px.
- Background: `#FFFFFF`. Border: 1.5px solid `#D6D3D1`. Corner radius: 8px.
- Focus State: 2px solid `#0F5132` with an ambient 3px tint `#0F513215`. No subtle placeholder styling; placeholders use `#78716C` to ensure readability outdoors.
- Mobile Money Prefix: Fixed country dialer badge (`+237`) rendered in `#E7E5E4` surface within the input start cap.

### 5. Checkboxes, Radios & Quantity Steppers
- Radio/Checkbox hitboxes: 48x48px outer tap zone, 22x22px inner control.
- Quantity Stepper: Pill container with distinct `—` and `+` touch segments (minimum 44x44px per icon) separated by high-contrast numbers in `#1C1917`.

### 6. Campus Delivery Status Badges
- Capsule pills with high-contrast text and solid 12% tinted surface backgrounds:
  - *En cuisine*: `#D97706` text on `#FEF3C7` background.
  - *En route (Livreur sur le campus)*: `#0F5132` text on `#DCFCE7` background.
  - *Prêt au comptoir*: `#EA580C` text on `#FFEDD5` background.