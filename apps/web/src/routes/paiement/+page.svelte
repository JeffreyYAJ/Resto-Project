<script lang="ts">
  let method: 'cash' | 'momo' = 'cash';
  let txnRef = '';

  const subtotal = 3000;
  const delivery = 300;
  const total = subtotal + delivery;

  const merchantNumber = '670 00 00 00';

  function selectMethod(next: 'cash' | 'momo') {
    method = next;
  }

  function copyNumber() {
    navigator.clipboard?.writeText('670000000');
  }

  function confirmOrder() {
    if (method === 'momo' && !txnRef.trim()) {
      txnRef = '';
      return;
    }
  }
</script>

<div class="mx-auto min-h-screen max-w-[430px] bg-[#fff8f5] pb-32 pt-4 text-[#1e1b19]">
  <header class="flex items-center justify-between px-4">
    <div class="flex items-center gap-3">
      <button aria-label="Retour" class="flex h-11 w-11 items-center justify-center rounded-full bg-white text-xl text-slate-700 shadow-sm">←</button>
      <h1 class="text-[20px] font-black tracking-[-0.03em] text-[#1e1b19]">Paiement</h1>
    </div>

    <div class="flex h-9 w-9 items-center justify-center rounded-full bg-[#003820] text-lg text-white">◌</div>
  </header>

  <main class="px-4 pt-4">
    <section class="rounded-[18px] bg-[#f3ece7] p-4 shadow-sm">
      <div class="flex items-center justify-between text-[12px] font-bold uppercase tracking-[0.12em] text-slate-500">
        <span class="rounded-full bg-[#b0f1c7] px-2 py-1 text-[#003820]">Étape 2 sur 2</span>
        <span>Validation finale</span>
      </div>

      <div class="mt-3 h-2 overflow-hidden rounded-full bg-[#e7dfd8]">
        <div class="h-full w-full rounded-full bg-[#003820]"></div>
      </div>
    </section>

    <section class="mt-4 rounded-[18px] bg-white p-4 shadow-sm">
      <div class="flex items-center justify-between text-[13px] font-medium text-slate-600">
        <span>Plats Resto U (Amphi 300)</span>
        <span class="font-bold text-slate-800">{subtotal.toLocaleString('fr-FR')} FCFA</span>
      </div>

      <div class="mt-2 flex items-center justify-between text-[13px] font-medium text-slate-600">
        <div class="flex items-center gap-1.5">
          <span>Livraison Express Campus</span>
          <span class="rounded-full bg-[#f4ece8] px-2 py-0.5 text-[11px] font-bold text-slate-600">Ngoa-Ekélé</span>
        </div>
        <span class="font-bold text-slate-800">{delivery.toLocaleString('fr-FR')} FCFA</span>
      </div>

      <div class="my-3 h-px bg-[#efe7e2]"></div>

      <div class="flex items-end justify-between">
        <div>
          <div class="text-[18px] font-black tracking-[-0.03em] text-slate-900">Total net à régler</div>
          <div class="text-[12px] text-slate-500">Toutes taxes et frais inclus</div>
        </div>

        <div class="text-right">
          <div class="text-[26px] font-black tracking-[-0.04em] text-[#a73a00]">{total.toLocaleString('fr-FR')}</div>
          <div class="text-[12px] font-bold uppercase tracking-[0.12em] text-[#a73a00]">FCFA</div>
        </div>
      </div>
    </section>

    <section class="mt-5">
      <div class="mb-3 flex items-center justify-between">
        <h2 class="text-[18px] font-black text-slate-900">Moyen de paiement</h2>
        <span class="flex items-center gap-1 text-[11px] font-bold uppercase tracking-[0.08em] text-slate-500">
          <span>🛡</span>
          <span>Chiffré SSL</span>
        </span>
      </div>

      <button
        type="button"
        class={`flex w-full flex-col rounded-[18px] border p-4 text-left shadow-sm transition ${
          method === 'cash' ? 'border-[#a73a00] bg-[#fffaf7]' : 'border-transparent bg-[#f3efec]'
        }`}
        on:click={() => selectMethod('cash')}
      >
        <div class="flex items-start justify-between gap-3">
          <div class="flex items-center gap-3">
            <div class="flex h-11 w-11 items-center justify-center rounded-xl bg-[#ffdbce] text-[#a73a00]">💳</div>
            <div>
              <div class="flex items-center gap-2">
                <span class="text-[15px] font-black text-slate-900">Cash à la livraison</span>
                <span class="rounded-full bg-[#b0f1c7] px-2 py-0.5 text-[10px] font-black uppercase tracking-[0.08em] text-[#003820]">Recommandé</span>
              </div>
              <span class="mt-1 block text-[12px] text-slate-500">Espèces en mains propres</span>
            </div>
          </div>

          <div class={`flex h-6 w-6 items-center justify-center rounded-full ${method === 'cash' ? 'bg-[#a73a00] text-white' : 'bg-[#e7e3df] text-transparent'}`}>
            ✓
          </div>
        </div>

        <div class="mt-3 rounded-[12px] bg-[#f4efec] p-3 text-[12px] leading-5 text-slate-600">
          Réglez <strong class="font-bold text-slate-900">3 300 FCFA</strong> en espèces directement au livreur lors de la remise de votre plat en amphi.
        </div>
      </button>

      <button
        type="button"
        class={`mt-3 flex w-full flex-col rounded-[18px] border p-4 text-left shadow-sm transition ${
          method === 'momo' ? 'border-[#a73a00] bg-[#fffaf7]' : 'border-transparent bg-[#f3efec]'
        }`}
        on:click={() => selectMethod('momo')}
      >
        <div class="flex items-start justify-between gap-3">
          <div class="flex items-center gap-3">
            <div class="flex h-11 w-11 items-center justify-center rounded-xl bg-[#eceae7] text-slate-700">📱</div>
            <div>
              <div class="flex items-center gap-2">
                <span class="text-[15px] font-black text-slate-900">Mobile Money</span>
                <span class="rounded-full bg-[#e7e3df] px-2 py-0.5 text-[10px] font-black uppercase tracking-[0.08em] text-slate-600">MTN • Orange</span>
              </div>
              <span class="mt-1 block text-[12px] text-slate-500">Transfert manuel direct U-YI</span>
            </div>
          </div>

          <div class={`flex h-6 w-6 items-center justify-center rounded-full ${method === 'momo' ? 'bg-[#a73a00] text-white' : 'bg-[#e7e3df] text-transparent'}`}>
            ✓
          </div>
        </div>

        {#if method === 'momo'}
          <div class="mt-4 space-y-3 rounded-[12px] bg-[#f7f1ee] p-3">
            <div class="rounded-[10px] bg-white p-3">
              <div class="flex items-center justify-between">
                <span class="text-[11px] font-bold uppercase tracking-[0.1em] text-slate-500">Compte Marchand Resto U</span>
                <span class="text-[11px] font-bold text-[#003820]">Vérifié YI</span>
              </div>
              <div class="mt-2 flex items-center justify-between rounded-[8px] bg-[#f2efe8] p-2">
                <div>
                  <div class="text-[18px] font-black tracking-[0.04em] text-slate-900">{merchantNumber}</div>
                  <div class="text-[11px] text-slate-500">Resto U Trésorerie Cameroun</div>
                </div>
                <button type="button" class="rounded-md bg-white px-2 py-1 text-[11px] font-bold text-slate-700" on:click={copyNumber}>Copier</button>
              </div>
            </div>

            <label class="block">
              <span class="mb-1 block text-[12px] font-bold uppercase tracking-[0.1em] text-slate-500">Référence de transaction SMS</span>
              <input bind:value={txnRef} placeholder="Ex: TXN-90283741 ou MP240..." class="w-full rounded-[10px] border border-[#e5ded8] bg-white px-3 py-3 text-[14px] text-slate-800 outline-none placeholder:text-slate-400" />
            </label>
          </div>
        {/if}
      </button>
    </section>

    <section class="mt-5 rounded-[18px] bg-[#003820] p-4 text-white shadow-sm">
      <div class="flex items-start gap-3">
        <div class="flex h-10 w-10 items-center justify-center rounded-full bg-white/10 text-lg">✓</div>
        <p class="text-[13px] leading-5 text-white/90">
          Votre repas est préparé immédiatement dès confirmation par la cantine. La livraison est sécurisée par un code secret OTP à 4 chiffres transmis sur votre écran et SMS.
        </p>
      </div>
    </section>
  </main>

  <div class="fixed inset-x-0 bottom-0 z-40 mx-auto max-w-[430px] bg-white/95 px-4 pb-[calc(env(safe-area-inset-bottom)+12px)] pt-3 shadow-[0_-3px_18px_rgba(0,0,0,0.08)] backdrop-blur-sm">
    <div class="mb-2 flex items-center justify-between text-[11px] font-bold uppercase tracking-[0.1em] text-slate-500">
      <span class="flex items-center gap-2">
        <span class="h-2 w-2 rounded-full bg-[#a73a00] animate-pulse"></span>
       Cuisine prête à dresser
      </span>
      <span class="text-slate-700">Paiement : {method === 'cash' ? 'Cash (Espèces)' : 'Mobile Money YI'}</span>
    </div>

    <button type="button" class="flex w-full items-center justify-center gap-2 rounded-[14px] bg-[#a73a00] px-4 py-3 text-[15px] font-black text-white shadow-md" on:click={confirmOrder}>
      <span>🛍</span>
      <span>
        {method === 'cash' ? 'Valider la commande (3 300 FCFA) • Paiement Cash' : txnRef.trim() ? 'Confirmer le Mobile Money (3 300 FCFA)' : 'Saisir la référence SMS (3 300 FCFA)'}
      </span>
    </button>
  </div>
</div>
