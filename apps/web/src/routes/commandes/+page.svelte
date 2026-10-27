<script lang="ts">
  import { orders } from '../../lib/mock-data';
</script>

<main class="mx-auto min-h-screen max-w-5xl px-4 pb-24 pt-6 text-slate-800 md:px-6">
  <header class="mb-6 flex items-center justify-between">
    <div>
      <p class="text-xs font-bold uppercase tracking-[0.2em] text-amber-600">Suivi</p>
      <h1 class="mt-2 text-3xl font-bold text-slate-900">Mes commandes</h1>
    </div>
    <a href="/restaurants" class="rounded-full border border-slate-200 bg-white px-3 py-2 text-sm font-medium text-slate-600">Nouvelle commande</a>
  </header>

  <div class="space-y-4">
    {#each orders as order}
      <a href={`/commandes/${order.id}`} class="block rounded-[2rem] border border-slate-200 bg-white p-4 shadow-sm">
        <div class="mb-3 flex items-start justify-between gap-3">
          <div>
            <p class="text-xs font-bold uppercase tracking-[0.18em] text-slate-500">{order.id}</p>
            <h2 class="mt-1 text-xl font-bold text-slate-900">{order.restaurant}</h2>
          </div>
          <span class="rounded-full bg-amber-100 px-2.5 py-1 text-xs font-semibold text-amber-700">{order.status}</span>
        </div>

        <div class="mb-3 space-y-1 text-sm text-slate-600">
          {#each order.items as item}
            <p>• {item}</p>
          {/each}
        </div>

        <div class="flex items-center justify-between text-sm text-slate-600">
          <span>{order.date}</span>
          <span class="font-semibold text-slate-900">{order.total.toLocaleString('fr-CM')} FCFA</span>
        </div>
        <div class="mt-3 flex items-center justify-between border-t border-slate-200 pt-3 text-sm text-slate-600">
          <span>ETA</span>
          <span class="font-semibold text-amber-700">{order.eta}</span>
        </div>
      </a>
    {/each}
  </div>
</main>
