<script lang="ts">
  const steps = [
    { label: 'Commande reçue', done: true },
    { label: 'Restaurant confirme', done: true },
    { label: 'Livreur en route', done: false },
    { label: 'Livraison terminée', done: false }
  ];
</script>

<main class="mx-auto min-h-screen max-w-md px-4 pb-24 pt-6 text-slate-800">
  <div class="mb-6 flex items-center justify-between">
    <a href="/commandes" class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-white px-3 py-2 text-sm font-medium text-slate-600">← Retour</a>
    <span class="text-sm font-semibold text-slate-500">UR-2401</span>
  </div>

  <section class="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm">
    <div class="flex items-start justify-between gap-3">
      <div>
        <p class="text-xs font-bold uppercase tracking-[0.18em] text-slate-500">Livraison</p>
        <h1 class="mt-2 text-3xl font-bold text-slate-900">En préparation</h1>
      </div>
      <span class="rounded-full bg-amber-100 px-2.5 py-1 text-xs font-semibold text-amber-700">12 min</span>
    </div>

    <div class="mt-5 rounded-2xl bg-slate-50 p-3">
      <p class="text-sm text-slate-500">Restaurant</p>
      <p class="mt-1 text-lg font-semibold text-slate-900">Cantine UD</p>
      <p class="mt-2 text-sm text-slate-600">Bâtiment A, salle 3 • 2e étage</p>
    </div>

    <div class="mt-6 space-y-4">
      {#each steps as step, index}
        <div class="flex items-start gap-3">
          <div class="mt-0.5 flex h-6 w-6 items-center justify-center rounded-full {step.done ? 'bg-emerald-500 text-white' : 'bg-slate-200 text-slate-500'}">
            {step.done ? '✓' : index + 1}
          </div>
          <div class="flex-1 border-b border-slate-100 pb-3">
            <p class="font-medium {step.done ? 'text-slate-900' : 'text-slate-500'}">{step.label}</p>
          </div>
        </div>
      {/each}
    </div>
  </section>
</main>
