<script lang="ts">
  import type { MenuItem } from '../../../lib/mock-data';

  let { data } = $props();
  const restaurant = $derived(data.restaurant);

  const formatPrice = (value: number) => `${value.toLocaleString('fr-CM')} FCFA`;

  function addToBasket(item: MenuItem) {
    console.log('Ajouter au panier', item.name);
  }
</script>

<main class="mx-auto min-h-screen max-w-5xl px-4 pb-24 pt-6 text-slate-800 md:px-6">
  <div class="mb-6 flex items-center justify-between">
    <a href="/restaurants" class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-white px-3 py-2 text-sm font-medium text-slate-600">← Retour</a>
    <a href="/panier" class="inline-flex items-center gap-2 rounded-full bg-slate-900 px-4 py-2 text-sm font-semibold text-white">Panier (3)</a>
  </div>

  <section class="overflow-hidden rounded-[2rem] border border-slate-200 bg-white shadow-sm">
    <img src={restaurant.image} alt={restaurant.name} class="h-52 w-full object-cover md:h-64" />
    <div class="p-5 md:p-6">
      <div class="mb-4 flex items-start justify-between gap-3">
        <div>
          <p class="text-xs font-bold uppercase tracking-[0.2em] text-amber-600">{restaurant.category}</p>
          <h1 class="mt-2 text-3xl font-bold text-slate-900">{restaurant.name}</h1>
        </div>
        <div class="rounded-full bg-amber-50 px-2.5 py-1.5 text-sm font-semibold text-amber-700">★ {restaurant.rating}</div>
      </div>

      <div class="mb-4 flex flex-wrap gap-2 text-sm text-slate-600">
        <span class="rounded-full border border-slate-200 px-2.5 py-1">{restaurant.deliveryTime}</span>
        <span class="rounded-full border border-slate-200 px-2.5 py-1">{restaurant.reviews} avis</span>
        <span class="rounded-full border border-slate-200 px-2.5 py-1">Frais: {restaurant.deliveryFee.toLocaleString('fr-CM')} FCFA</span>
      </div>

      <p class="text-sm leading-6 text-slate-600">{restaurant.description}</p>
    </div>
  </section>

  <div class="mt-8 space-y-6">
    {#each restaurant.menu as section}
      <section>
        <h2 class="mb-4 text-xl font-bold text-slate-900">{section.title}</h2>
        <div class="space-y-3">
          {#each section.items as item}
            <article class="flex items-start justify-between gap-4 rounded-[1.5rem] border border-slate-200 bg-white p-4 shadow-sm">
              <div class="flex-1">
                <div class="mb-1 flex items-center gap-2">
                  <h3 class="text-lg font-semibold text-slate-900">{item.name}</h3>
                  {#if item.badge}
                    <span class="rounded-full bg-amber-100 px-2 py-1 text-[10px] font-bold uppercase tracking-[0.1em] text-amber-700">{item.badge}</span>
                  {/if}
                </div>
                <p class="text-sm leading-6 text-slate-500">{item.description}</p>
              </div>

              <div class="flex flex-col items-end gap-3">
                <span class="text-base font-bold text-slate-900">{formatPrice(item.price)}</span>
                <button type="button" onclick={() => addToBasket(item)} class="rounded-full bg-slate-900 px-3.5 py-2 text-sm font-semibold text-white">Ajouter</button>
              </div>
            </article>
          {/each}
        </div>
      </section>
    {/each}
  </div>
</main>
