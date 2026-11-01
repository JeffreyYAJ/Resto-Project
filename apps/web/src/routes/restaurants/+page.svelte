<script lang="ts">
  import { quickFilters, restaurants } from '$lib/mock-data';
</script>

<main class="mx-auto min-h-screen max-w-6xl px-4 pb-24 pt-6 text-slate-800 md:px-6">
  <header class="mb-6 flex items-center justify-between">
    <div>
      <p class="text-xs font-bold uppercase tracking-[0.2em] text-amber-600">Restaurant U</p>
      <h1 class="mt-2 text-3xl font-bold text-slate-900">Restaurants</h1>
    </div>
    <a href="/panier" class="inline-flex items-center gap-2 rounded-full bg-slate-900 px-4 py-2 text-sm font-semibold text-white">Panier (3)</a>
  </header>

  <div class="mb-6 flex gap-2 overflow-x-auto pb-2">
    {#each quickFilters as filter}
      <button class:selected={filter === 'Tout'} class="whitespace-nowrap rounded-full border border-slate-200 bg-white px-3 py-2 text-sm font-medium text-slate-600">
        {filter}
      </button>
    {/each}
  </div>

  <div class="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
    {#each restaurants as restaurant}
      <a href={`/restaurants/${restaurant.slug}`} class="group overflow-hidden rounded-[2rem] border border-slate-200 bg-white shadow-sm transition hover:-translate-y-0.5 hover:shadow-md">
        <div class="relative h-48 overflow-hidden">
          <img src={restaurant.image} alt={restaurant.name} class="h-full w-full object-cover transition duration-300 group-hover:scale-105" />
          <div class="absolute inset-x-0 top-0 flex items-center justify-between p-3">
            <span class="rounded-full bg-white/90 px-2.5 py-1 text-xs font-semibold text-slate-800">{restaurant.category}</span>
            <span class="rounded-full bg-slate-900/80 px-2.5 py-1 text-xs font-semibold text-white">{restaurant.deliveryTime}</span>
          </div>
        </div>

        <div class="p-4">
          <div class="mb-2 flex items-start justify-between gap-3">
            <div>
              <h2 class="text-xl font-bold text-slate-900">{restaurant.name}</h2>
              <p class="mt-1 text-sm text-slate-500">{restaurant.description}</p>
            </div>
            <div class="rounded-full bg-amber-50 px-2 py-1 text-sm font-semibold text-amber-700">★ {restaurant.rating}</div>
          </div>

          <div class="mb-3 flex flex-wrap gap-2">
            {#each restaurant.tags as tag}
              <span class="rounded-full border border-slate-200 px-2 py-1 text-[11px] font-medium uppercase tracking-[0.08em] text-slate-500">{tag}</span>
            {/each}
          </div>

          <div class="flex items-center justify-between text-sm text-slate-600">
            <span>{restaurant.reviews} avis</span>
            <span class="font-semibold text-slate-900">Frais: {restaurant.deliveryFee.toLocaleString('fr-CM')} FCFA</span>
          </div>
        </div>
      </a>
    {/each}
  </div>
</main>
