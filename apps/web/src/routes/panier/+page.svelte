<script lang="ts">
  import { cartItems } from '$lib/mock-data';

  const subtotal = cartItems.reduce((sum, item) => sum + item.unitPrice * item.quantity, 0);
  const deliveryFee = 500;
  const total = subtotal + deliveryFee;
</script>

<main class="mx-auto min-h-screen max-w-md px-4 pb-24 pt-6 text-slate-800 md:px-0">
  <header class="mb-6 flex items-center justify-between">
    <div>
      <p class="text-xs font-bold uppercase tracking-[0.2em] text-amber-600">Commande</p>
      <h1 class="mt-2 text-3xl font-bold text-slate-900">Panier</h1>
    </div>
    <a href="/restaurants" class="text-sm font-medium text-slate-500">Ajouter</a>
  </header>

  <div class="space-y-4 rounded-[2rem] border border-slate-200 bg-white p-4 shadow-sm">
    {#each cartItems as item}
      <div class="flex items-center justify-between gap-3 rounded-2xl bg-slate-50 p-3">
        <div>
          <p class="font-semibold text-slate-900">{item.name}</p>
          <p class="text-sm text-slate-500">Qté: {item.quantity}</p>
        </div>
        <span class="font-bold text-slate-900">{(item.unitPrice * item.quantity).toLocaleString('fr-CM')} FCFA</span>
      </div>
    {/each}
  </div>

  <div class="mt-6 rounded-[2rem] border border-slate-200 bg-white p-4 shadow-sm">
    <h2 class="mb-4 text-lg font-bold text-slate-900">Résumé</h2>
    <div class="space-y-3 text-sm text-slate-600">
      <div class="flex justify-between"><span>Sous-total</span><span>{subtotal.toLocaleString('fr-CM')} FCFA</span></div>
      <div class="flex justify-between"><span>Livraison</span><span>{deliveryFee.toLocaleString('fr-CM')} FCFA</span></div>
      <div class="flex justify-between border-t border-slate-200 pt-3 text-base font-bold text-slate-900"><span>Total</span><span>{total.toLocaleString('fr-CM')} FCFA</span></div>
    </div>

    <div class="mt-5 space-y-3">
      <label class="block text-sm font-medium text-slate-600">
        <span class="mb-1 block">Lieu de livraison</span>
        <input value="Bâtiment A, salle 3" class="w-full rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3 outline-none focus:border-amber-400" />
      </label>
      <label class="block text-sm font-medium text-slate-600">
        <span class="mb-1 block">Indications</span>
        <textarea rows="3" class="w-full rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3 outline-none focus:border-amber-400">À côté de la bibliothèque, 2e étage.</textarea>
      </label>
    </div>

    <a href="/commandes" class="mt-5 block rounded-2xl bg-amber-500 px-4 py-3 text-center text-base font-semibold text-white shadow-sm">Valider la commande</a>
  </div>
</main>
