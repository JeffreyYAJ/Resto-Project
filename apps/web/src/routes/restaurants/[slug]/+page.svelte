<script lang="ts">
  import type { MenuItem } from '../../../lib/mock-data';

  let { data } = $props();
  const restaurant = $derived(data.restaurant);

  const formatPrice = (value: number) => `${value.toLocaleString('fr-CM')} FCFA`;

  const menuTabs = ['Menu du Jour (Disponibles)', 'Boissons & Jus locaux'];
  const categories = ['Plats Chauds Cuisinés', 'Service Midi'];

  const featured = {
    name: 'Ndolé royal aux crevettes & po...',
    description: 'Feuilles amères mijotées, arachides...',
    price: 1500,
    image:
      'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=900&q=80',
    badge: 'Populaire'
  };

  const baseDishes = [
    { name: 'Poulet DG de l’étudiant', price: 1200, description: 'Plantain frit doré, carottes, haricots...', image: 'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=900&q=80', stock: 'Restant: 8', quantity: 1 },
    { name: 'Koki de maïs & banane', price: 800, description: 'Cuit à l’aveur sous feu...', image: 'https://images.unsplash.com/photo-1559847844-5315695dadae?auto=format&fit=crop&w=900&q=80', quantity: 0 },
    { name: 'Eru traditionnel & ...', price: 1000, description: 'Feuilles d’Eru fraîches...', image: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=900&q=80', quantity: 0 }
  ];

  const drinks = [
    { name: 'Jus de Bissap glacé maison', description: 'Hibiscus, menthe, clou de girofle', price: 300, image: 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&fit=crop&w=900&q=80' },
    { name: 'Jus de Corossol naturel', description: 'Pur fruit pressé sans sucre ajouté', price: 400, image: 'https://images.unsplash.com/photo-1502741338009-cac2772e18bc?auto=format&fit=crop&w=900&q=80' }
  ];

  function addToBasket(item: MenuItem) {
    console.log('Ajouter au panier', item.name);
  }
</script>

<main class="mx-auto min-h-screen max-w-[430px] bg-[#f0efe8] pb-28 pt-3 text-slate-800">
  <div class="px-3">
    <header class="flex items-center justify-between pb-1">
      <div class="flex items-center gap-2">
        <div class="flex h-9 w-9 items-center justify-center rounded-xl border border-slate-300 bg-white text-[10px] font-bold text-slate-700">
          Logo
        </div>
      </div>

      <div class="flex items-center gap-1 text-[28px] font-black tracking-[-0.05em] text-slate-900">
        <span>Resto</span>
        <span class="text-[34px] leading-none">U</span>
      </div>

      <div class="flex items-center gap-2">
        <div class="flex items-center gap-1 rounded-full border border-slate-300 bg-white px-2 py-1 text-[11px] text-slate-700">
          <span>◉</span>
          <span>Ngoa-Ekélé</span>
        </div>
        <div class="flex h-9 w-9 items-center justify-center rounded-full bg-gradient-to-br from-[#c9d7d3] to-[#8aa29a] text-sm font-bold text-white ring-2 ring-white">
          3A17
        </div>
      </div>
    </header>

    <div class="mt-2 flex items-center justify-between">
      <div class="text-[22px] font-black text-slate-900">{restaurant.name}</div>
      <div class="flex h-11 w-11 items-center justify-center rounded-2xl bg-[#1a5b4e] text-xl text-white">🛒</div>
    </div>

    <div class="mt-3 flex items-center gap-2 text-[14px] text-slate-600">
      <span>📍</span>
      <span>À côté de l’Ampi 700 • Campus UY1</span>
    </div>

    <div class="mt-3 flex items-center gap-2 rounded-[18px] bg-[#dfe7e2] px-3 py-2 text-[13px] font-medium text-[#1f5d51]">
      <span class="h-2.5 w-2.5 rounded-full bg-[#31b76b]" />
      <span>Ouverte (Prend les commandes)</span>
    </div>

    <div class="mt-3 flex items-center justify-between rounded-[16px] bg-[#e5e1d9] px-3 py-2 text-[13px] text-slate-600">
      <div class="flex items-center gap-2">
        <span>◔</span>
        <span>Délai est. : -20 min</span>
      </div>
      <div class="font-bold text-[#1d5b4c]">★ 4.8 (380+ avis)</div>
    </div>

    <div class="mt-4 rounded-[18px] bg-[#f1d2b8] p-3 text-[13px] leading-5 text-slate-800">
      <span class="font-black">ℹ</span>
      <span class="ml-2 font-medium">Règle de commande : 1 commande = 1 seul restaurant à la fois pour garantir une livraison express entre vos amphithéâtres.</span>
    </div>

    <div class="mt-5 flex border-b border-slate-200">
      {#each menuTabs as tab, index}
        <button class={`flex-1 pb-3 text-left text-[15px] font-black ${index === 0 ? 'border-b-2 border-slate-900 text-slate-900' : 'text-slate-500'}`}>
          {tab}
        </button>
      {/each}
    </div>

    <div class="mt-4 flex gap-3 text-[15px] font-black">
      {#each categories as category, index}
        <button class={`rounded-full px-3 py-2 ${index === 0 ? 'bg-[#e7e2dc] text-slate-700' : 'bg-transparent text-slate-500'}`}>
          {category}
        </button>
      {/each}
    </div>

    <section class="mt-5 rounded-[22px] bg-[#f2eee7] p-3 shadow-sm">
      <div class="flex gap-3">
        <img src={featured.image} alt={featured.name} class="h-20 w-20 rounded-[16px] object-cover" />
        <div class="flex-1">
          <div class="flex items-center justify-between gap-2">
            <h3 class="text-[15px] font-black text-slate-900">{featured.name}</h3>
            <span class="rounded-full bg-[#f1d6b8] px-2 py-1 text-[10px] font-bold uppercase tracking-[0.08em] text-[#8b4a1d]">{featured.badge}</span>
          </div>
          <p class="mt-1 text-[13px] leading-5 text-slate-600">{featured.description}</p>
          <div class="mt-2 flex items-center justify-between">
            <div class="text-[24px] font-black text-slate-900">{featured.price.toLocaleString('fr-CM')} FCFA</div>
          </div>
        </div>
      </div>

      <div class="mt-3 flex items-center justify-between rounded-[14px] bg-[#e6e5e0] px-2 py-2 text-[12px] text-slate-600">
        <span>Accompagnement inclus (1 au choix) :</span>
        <span class="rounded-full bg-[#1a5b4e] px-2 py-1 font-bold text-white">Obligatoire</span>
      </div>

      <div class="mt-3 grid grid-cols-2 gap-2">
        <button class="rounded-[12px] bg-[#1a5b4e] px-2 py-2 text-left text-[12px] font-bold text-white">Plantain vapeur</button>
        <button class="rounded-[12px] bg-[#e8e4df] px-2 py-2 text-left text-[12px] font-bold text-slate-700">Riz parfumé</button>
      </div>

      <div class="mt-4 flex items-center justify-between gap-3">
        <div class="flex items-center gap-2 text-[13px] text-slate-600">
          <span>• En stock chaud</span>
        </div>
        <div class="flex items-center gap-3">
          <button class="flex h-8 w-8 items-center justify-center rounded-full bg-[#dccfc5] text-xl text-slate-700">−</button>
          <span class="text-[18px] font-black text-slate-900">1</span>
          <button class="flex h-8 w-8 items-center justify-center rounded-full bg-[#f08d52] text-xl text-white">+</button>
        </div>
      </div>
    </section>

    <section class="mt-4 space-y-3">
      {#each baseDishes as dish}
        <article class="flex items-center gap-3 rounded-[20px] bg-[#f2eee7] p-2 shadow-sm">
          <img src={dish.image} alt={dish.name} class="h-16 w-16 rounded-[14px] object-cover" />
          <div class="flex-1">
            <div class="flex items-start justify-between gap-2">
              <div>
                <h4 class="text-[16px] font-black text-slate-900">{dish.name}</h4>
                <p class="mt-1 text-[12px] leading-5 text-slate-600">{dish.description}</p>
              </div>
              {#if dish.quantity > 0}
                <span class="rounded-full bg-[#f3d6be] px-2 py-1 text-[10px] font-bold text-[#8b4a1d]">{dish.stock}</span>
              {/if}
            </div>
            <div class="mt-2 flex items-center justify-between">
              <div class="text-[20px] font-black text-slate-900">{dish.price.toLocaleString('fr-CM')} FCFA</div>
              {#if dish.quantity === 0}
                <button class="rounded-full bg-[#e8e4df] px-3 py-1 text-[12px] font-bold text-slate-700">+ Ajouter</button>
              {:else}
                <div class="flex items-center gap-3">
                  <button class="flex h-7 w-7 items-center justify-center rounded-full bg-[#dccfc5] text-lg text-slate-700">−</button>
                  <span class="text-[16px] font-black text-slate-900">{dish.quantity}</span>
                  <button class="flex h-7 w-7 items-center justify-center rounded-full bg-[#f08d52] text-lg text-white">+</button>
                </div>
              {/if}
            </div>
          </div>
        </article>
      {/each}
    </section>

    <section class="mt-5">
      <div class="mb-3 flex items-center gap-2 text-[15px] font-black text-slate-900">
        <span>◫</span>
        <span>Boissons Fraîches & Jus Maison</span>
        <span class="ml-auto text-[12px] font-semibold text-slate-500">50 cl</span>
      </div>

      <div class="grid grid-cols-2 gap-3">
        {#each drinks as drink}
          <article class="rounded-[18px] bg-[#f1eee8] p-2 shadow-sm">
            <img src={drink.image} alt={drink.name} class="h-24 w-full rounded-[14px] object-cover" />
            <div class="mt-2">
              <div class="text-[12px] font-bold text-slate-700">{drink.name}</div>
              <div class="mt-1 text-[11px] leading-4 text-slate-600">{drink.description}</div>
              <div class="mt-3 flex items-center justify-between">
                <div class="text-[20px] font-black text-slate-900">{drink.price.toLocaleString('fr-CM')} FCFA</div>
                <button class="flex h-7 w-7 items-center justify-center rounded-full bg-[#f08d52] text-xl text-white">+</button>
              </div>
            </div>
          </article>
        {/each}
      </div>
    </section>

    <div class="mt-5 flex items-center justify-between rounded-[16px] bg-[#f0e8e1] px-3 py-3 text-[13px] text-slate-700">
      <div class="flex items-center gap-2">
        <span>🚚</span>
        <span>Retrait direct ou livraison Amphi</span>
      </div>
      <span class="text-[12px] font-semibold text-slate-600">Précisez votre salle ou banc lors du paiement</span>
    </div>

    <div class="mt-5 flex items-center justify-between rounded-[22px] bg-[#1c5d52] px-3 py-3 text-white shadow-sm">
      <div class="flex items-center gap-2">
        <div class="flex h-8 w-8 items-center justify-center rounded-full bg-[#f08d52] text-base">🛒</div>
        <div>
          <div class="text-[11px] uppercase tracking-[0.08em] text-white/70">Panier Cantine Centre</div>
          <div class="text-[13px] text-white/90">2 articles • Ndolé + Poule...</div>
        </div>
      </div>
      <div class="flex items-center gap-2 text-[16px] font-black">
        <span>2 700 FCFA</span>
        <span>→</span>
      </div>
    </div>
  </div>

  <nav class="fixed inset-x-0 bottom-0 mx-auto max-w-[430px] border-t border-slate-200 bg-[#f1f0eb] pb-[calc(env(safe-area-inset-bottom)+8px)] pt-2 shadow-[0_-8px_20px_rgba(15,23,42,0.05)]">
    <div class="grid grid-cols-4 items-center px-3 text-center">
      <div class="flex flex-col items-center gap-1 py-2 text-slate-500">
        <div class="text-2xl">⌂</div>
        <span class="text-[11px]">Cantines</span>
      </div>
      <div class="flex flex-col items-center gap-1 py-2 text-slate-500">
        <div class="text-2xl">▣</div>
        <span class="text-[11px]">Commandes</span>
      </div>
      <div class="flex flex-col items-center gap-1 py-2 text-[#eb6a2a]">
        <div class="relative text-2xl">
          🛒
          <span class="absolute -right-2 -top-1 flex h-4 min-w-4 items-center justify-center rounded-full bg-[#ef5f39] px-1 text-[9px] font-bold text-white">2</span>
        </div>
        <span class="text-[11px] font-bold">Panier</span>
      </div>
      <div class="flex flex-col items-center gap-1 py-2 text-slate-500">
        <div class="text-2xl">◌</div>
        <span class="text-[11px]">Compte</span>
      </div>
    </div>
  </nav>
</main>
