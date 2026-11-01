export type MenuItem = {
  id: string;
  name: string;
  description: string;
  price: number;
  badge?: string;
  popular?: boolean;
};

export type RestaurantCategory = {
  title: string;
  items: MenuItem[];
};

export type Restaurant = {
  id: string;
  slug: string;
  name: string;
  category: string;
  deliveryTime: string;
  rating: number;
  reviews: number;
  deliveryFee: number;
  image: string;
  accent: string;
  tags: string[];
  description: string;
  menu: RestaurantCategory[];
};

export type OrderStatus = 'En préparation' | 'En livraison' | 'Livrée' | 'À confirmer';

export type Order = {
  id: string;
  restaurant: string;
  date: string;
  total: number;
  status: OrderStatus;
  eta: string;
  items: string[];
};

export const restaurants: Restaurant[] = [
  {
    id: 'resto-1',
    slug: 'cantine-ud',
    name: 'Cantine UD',
    category: 'Cuisine locale',
    deliveryTime: '18-25 min',
    rating: 4.8,
    reviews: 182,
    deliveryFee: 500,
    image:
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=1200&q=80',
    accent: '#f59e0b',
    tags: ['Fast', 'Campus', 'Saine'],
    description: 'Plats du jour, riz, poisson, sauces maison et options végétariennes.',
    menu: [
      {
        title: 'Plats du jour',
        items: [
          {
            id: 'p1',
            name: 'Poisson braisé + riz',
            description: 'Avec sauce tomate et légumes frais.',
            price: 2900,
            badge: 'Best seller',
            popular: true
          },
          {
            id: 'p2',
            name: 'Poulet grillé',
            description: 'Servi avec plantain et salade.',
            price: 3200,
            badge: 'Signature'
          },
          {
            id: 'p3',
            name: 'Dovè + igname',
            description: 'Repas complet à la cuisson douce.',
            price: 2500
          }
        ]
      },
      {
        title: 'Snacks',
        items: [
          {
            id: 's1',
            name: 'Samosa au poulet',
            description: '2 pièces croustillantes.',
            price: 1200
          },
          {
            id: 's2',
            name: 'Chips maison',
            description: 'Petite portion salée.',
            price: 700
          }
        ]
      }
    ]
  },
  {
    id: 'resto-2',
    slug: 'mami-cuisine',
    name: 'Mami Cuisine',
    category: 'Burger & grill',
    deliveryTime: '20-30 min',
    rating: 4.7,
    reviews: 143,
    deliveryFee: 600,
    image:
      'https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=1200&q=80',
    accent: '#dc2626',
    tags: ['Burger', 'Familial', 'Rapide'],
    description: 'Paniers gourmands et menus étudiants pour repas entre cours.',
    menu: [
      {
        title: 'Burgers',
        items: [
          {
            id: 'b1',
            name: 'Classic Burger',
            description: 'Steak, fromage et salade.',
            price: 2800,
            popular: true
          },
          {
            id: 'b2',
            name: 'Double Burger',
            description: 'Double viande et oignon.',
            price: 3400,
            badge: 'Populaire'
          }
        ]
      },
      {
        title: 'Accompagnements',
        items: [
          {
            id: 'b3',
            name: 'Frites fraîches',
            description: 'Portion généreuse.',
            price: 800
          },
          {
            id: 'b4',
            name: 'Nuggets',
            description: '6 pièces croustillantes.',
            price: 1000
          }
        ]
      }
    ]
  },
  {
    id: 'resto-3',
    slug: 'safou-spot',
    name: 'Safou Spot',
    category: 'Salades & fruits',
    deliveryTime: '15-20 min',
    rating: 4.9,
    reviews: 205,
    deliveryFee: 450,
    image:
      'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=1200&q=80',
    accent: '#10b981',
    tags: ['Healthy', 'Végétarien', 'Fraîcheur'],
    description: 'Salades, bols frais et jus de fruits pour un repas léger au campus.',
    menu: [
      {
        title: 'Salades',
        items: [
          {
            id: 'sa1',
            name: 'Salade verte locale',
            description: 'Laitue, tomate, concombre, avocat.',
            price: 2200,
            popular: true
          },
          {
            id: 'sa2',
            name: 'Salade de quinoa',
            description: 'Protein boost et légumes croquants.',
            price: 2600
          }
        ]
      },
      {
        title: 'Boissons',
        items: [
          {
            id: 'sa3',
            name: 'Jus d’orange frais',
            description: 'Pressé sur place.',
            price: 900
          },
          {
            id: 'sa4',
            name: 'Limonade citron',
            description: 'Boisson rafraîchissante.',
            price: 700
          }
        ]
      }
    ]
  }
];

export const cartItems = [
  { id: 'p1', name: 'Poisson braisé + riz', quantity: 1, unitPrice: 2900 },
  { id: 'b1', name: 'Classic Burger', quantity: 2, unitPrice: 2800 },
  { id: 'sa3', name: 'Jus d’orange frais', quantity: 1, unitPrice: 900 }
];

export const orders: Order[] = [
  {
    id: 'UR-2401',
    restaurant: 'Cantine UD',
    date: 'Aujourd’hui, 12:45',
    total: 6200,
    status: 'En préparation',
    eta: '12 min',
    items: ['Poisson braisé + riz', 'Salade verte']
  },
  {
    id: 'UR-2398',
    restaurant: 'Mami Cuisine',
    date: 'Hier, 19:10',
    total: 5800,
    status: 'En livraison',
    eta: '5 min',
    items: ['Classic Burger', 'Frites fraîches']
  },
  {
    id: 'UR-2390',
    restaurant: 'Safou Spot',
    date: 'Lundi, 13:22',
    total: 4800,
    status: 'Livrée',
    eta: 'Livré',
    items: ['Salade verte locale', 'Jus d’orange frais']
  }
];

export const quickFilters = ['Tout', 'Campus', 'Fast', 'Healthy', 'Halal', 'Vegetarian'];
