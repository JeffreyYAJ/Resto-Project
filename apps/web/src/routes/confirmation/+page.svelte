<script lang="ts">
  const orderRef = '#RU-4821';
  const orderState = 'En attente cantine';
  const eta = '20 à 25 minutes';
  const pointLivraison = 'Faculté des Sciences, Amphi 700';

  const items = [
    { qty: 1, label: 'Ndolé Royal Crevettes (Miondo)', price: '1 800 FCFA' },
    { qty: 1, label: 'Poulet DG des étudiants', price: '1 200 FCFA' },
    { qty: 1, label: 'Jus de Bissap glacé (50cl)', price: '300 FCFA' }
  ];

  const otpDigits = ['8', '4', '1', '9'];
</script>

<div class="mx-auto min-h-screen max-w-[430px] bg-[#fff8f5] pb-28 pt-4 text-[#1e1b19]">
  <header class="flex items-center justify-between px-4">
    <div class="flex items-center gap-3">
      <div class="flex h-10 w-10 items-center justify-center rounded-xl bg-[#003820] text-[#fff] shadow-sm">🍽</div>
      <div class="flex flex-col">
        <div class="flex items-center gap-2">
          <span class="text-[18px] font-black tracking-[-0.03em] text-[#003820]">Resto U</span>
          <span class="rounded-full bg-[#ffdbce] px-1.5 py-0.5 text-[10px] font-black uppercase tracking-[0.08em] text-[#a73a00]">UY1</span>
        </div>
        <div class="flex items-center gap-1 text-[12px] text-slate-500">
          <span>📍</span>
          <span>Ngoa-Ekélé</span>
        </div>
      </div>
    </div>

    <div class="flex items-center gap-2">
      <div class="flex items-center gap-1.5 rounded-full bg-[#f4ece8] px-2.5 py-1 text-[11px] font-bold text-slate-600">
        <span>◈</span>
        <span>3A17</span>
      </div>
      <div class="flex h-8 w-8 items-center justify-center rounded-full bg-[#003820] text-sm text-white">◌</div>
    </div>
  </header>

  <main class="px-4 pt-5">
    <section class="flex flex-col items-center text-center">
      <div class="relative mb-3 flex h-20 w-20 items-center justify-center">
        <div class="absolute inset-0 rounded-full bg-[#b0f1c7] opacity-40 animate-ping"></div>
        <div class="relative flex h-16 w-16 items-center justify-center rounded-full bg-[#0f5132] text-[34px] text-white shadow-md">✓</div>
      </div>

      <div class="inline-flex items-center gap-2 rounded-full bg-[#ffdbce] px-3 py-1 text-[11px] font-black uppercase tracking-[0.12em] text-[#a73a00]">
        <span class="h-2 w-2 rounded-full bg-[#a73a00] animate-pulse"></span>
        <span>Commande transmise</span>
      </div>

      <h1 class="mt-3 text-[26px] font-black tracking-[-0.05em] text-[#003820]">Commande confirmée !</h1>

      <p class="mt-1 text-[14px] text-slate-600">
        Référence <span class="rounded-lg bg-[#f3ece7] px-2 py-1 text-[13px] font-black text-slate-800">{orderRef}</span>
      </p>
    </section>

    <section class="mt-5 rounded-[18px] bg-[#f4eee9] p-3 shadow-sm">
      <div class="flex items-center justify-between gap-3">
        <div class="flex items-center gap-3 min-w-0">
          <div class="flex h-9 w-9 items-center justify-center rounded-xl bg-white text-[18px] text-[#003820] shadow-sm">⇄</div>
          <div class="min-w-0">
            <div class="text-[11px] font-bold uppercase tracking-[0.1em] text-slate-500">État du système (UY1-Core)</div>
            <div class="truncate text-[15px] font-black text-[#003820]">{orderState}</div>
          </div>
        </div>

        <div class="rounded-full bg-white px-2.5 py-1 text-[10px] font-black uppercase tracking-[0.1em] text-slate-600 shadow-sm">pending_restaurant</div>
      </div>
    </section>

    <section class="mt-4 rounded-[18px] bg-white p-4 shadow-sm">
      <div class="flex items-center gap-2 text-[#a73a00]">
        <span class="text-[18px]">⏱</span>
        <span class="text-[18px] font-black tracking-[-0.03em]">{eta}</span>
      </div>

      <div class="mt-3">
        <div class="flex items-center justify-between text-[12px] font-bold text-slate-700">
          <span>Arrivée estimée vers 12h35</span>
          <span class="font-black text-[#0f5132]">Étape 1/4</span>
        </div>
        <div class="mt-2 h-2 overflow-hidden rounded-full bg-[#efe8e2]">
          <div class="h-full w-1/4 rounded-full bg-[#0f5132]"></div>
        </div>
      </div>

      <div class="mt-3 flex items-center gap-2 text-[13px] text-slate-600">
        <span class="text-[#0f5132]">📍</span>
        <span>Point de chute : <strong class="text-slate-800">{pointLivraison}</strong></span>
      </div>
    </section>

    <section class="mt-4 rounded-[18px] bg-gradient-to-br from-[#a73a00] to-[#6e3900] p-4 text-white shadow-lg">
      <div class="flex items-center justify-between">
        <div class="flex items-center gap-2">
          <div class="flex h-7 w-7 items-center justify-center rounded-full bg-white/15 text-lg">🔑</div>
          <div class="text-[15px] font-black uppercase tracking-[0.12em] text-[#ffe9d5]">Code Secret de Livraison</div>
        </div>
        <div class="rounded-full bg-white/15 px-2 py-0.5 text-[10px] font-black uppercase tracking-[0.1em] text-[#ffe9d5]">OTP</div>
      </div>

      <div class="mt-4 grid grid-cols-4 gap-3">
        {#each otpDigits as digit}
          <div class="flex h-16 items-center justify-center rounded-[14px] bg-white text-[32px] font-black text-slate-900 shadow-md">
            {digit}
          </div>
        {/each}
      </div>

      <div class="mt-4 rounded-[12px] bg-white/10 p-3 text-[12px] leading-5 text-[#ffe9d5]">
        <strong class="text-white">Consigne impérative :</strong> Ne donnez ce code au livreur qu’après avoir reçu et vérifié votre sachet scellé ! Il devra le saisir pour valider la remise.
      </div>
    </section>

    <section class="mt-4 rounded-[18px] bg-white p-4 shadow-sm">
      <div class="flex items-center justify-between pb-2">
        <div class="flex items-center gap-3">
          <div class="flex h-8 w-8 items-center justify-center rounded-lg bg-[#f4ece8] text-[#003820]">🏪</div>
          <div>
            <div class="text-[14px] font-black text-slate-900">Cantine Centrale Ngoa-Ekélé</div>
            <div class="text-[12px] text-slate-500">Préparation des plats du terroir</div>
          </div>
        </div>
        <span class="rounded-full bg-[#b0f1c7] px-2 py-1 text-[10px] font-black uppercase tracking-[0.1em] text-[#003820]">Sur place</span>
      </div>

      <div class="mt-3 space-y-2">
        {#each items as item}
          <div class="flex items-center justify-between gap-3 text-[13px] text-slate-700">
            <div class="flex items-center gap-2">
              <span class="flex h-6 w-6 items-center justify-center rounded-md bg-[#f4ece8] text-[11px] font-black text-[#003820]">{item.qty}x</span>
              <span>{item.label}</span>
            </div>
            <span class="font-black text-slate-900">{item.price}</span>
          </div>
        {/each}
      </div>

      <div class="mt-4 flex items-center justify-between rounded-[12px] bg-[#f6f0eb] p-3">
        <div>
          <div class="text-[11px] font-bold uppercase tracking-[0.1em] text-slate-500">Mode de règlement</div>
          <div class="mt-1 flex items-center gap-2 text-[14px] font-black text-[#a73a00]">
            <span>💸</span>
            <span>Cash à la livraison</span>
          </div>
        </div>
        <div class="text-right">
          <div class="text-[11px] font-bold uppercase tracking-[0.1em] text-slate-500">Montant à remettre</div>
          <div class="text-[22px] font-black tracking-[-0.04em] text-[#003820]">3 300 FCFA</div>
        </div>
      </div>

      <div class="mt-4 flex items-start gap-2 rounded-[12px] bg-[#f3efe8] p-3 text-[12px] leading-5 text-slate-600">
        <span class="text-[#a73a00]">🎓</span>
        <div><strong class="text-slate-900">Point de rendez-vous :</strong> Faculté des Sciences, Amphi 700 / Salle C12. Merci de rester joignable sur votre téléphone.</div>
      </div>
    </section>

    <div class="mt-5 flex flex-col gap-3">
      <button class="flex w-full items-center justify-center gap-2 rounded-[14px] bg-[#a73a00] px-4 py-3 text-[15px] font-black text-white shadow-md">
        <span>📍</span>
        <span>Suivre l’acheminement en direct</span>
      </button>

      <a href="https://wa.me/237670000000?text=Bonjour%20Support%20Resto%20U%2C%20suivi%20de%20la%20commande%20RU-4821" target="_blank" class="flex w-full items-center justify-center gap-2 rounded-[14px] bg-[#0f5132] px-4 py-3 text-[15px] font-black text-white shadow-sm">
        <span>💬</span>
        <span>Urgence WhatsApp (+237 670 00 00 00)</span>
      </a>

      <a href="/" class="mt-1 flex items-center justify-center gap-2 text-[13px] font-bold text-slate-500">
        <span>←</span>
        <span>Retour à l’accueil du campus</span>
      </a>
    </div>
  </main>
</div>
