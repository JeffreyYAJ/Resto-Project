<script lang="ts">
  const steps = [
    { label: 'Commande reçue', done: true },
    { label: 'Restaurant confirme', done: true },
    { label: 'Livreur en route', done: false },
    { label: 'Livraison terminée', done: false }
  ];
</script>

<div class="mx-auto min-h-screen max-w-[430px] bg-[#f2efe9] pb-20 pt-3 text-slate-800">
  <div class="px-3">
    <header class="flex items-center justify-between pb-2">
      <div class="flex items-center gap-2">
        <div class="flex h-9 w-9 items-center justify-center rounded-xl border border-slate-300 bg-white text-[10px] font-bold text-slate-700">
          Logo
        </div>
      </div>

      <div class="text-left">
        <div class="text-[28px] font-black tracking-[-0.05em] text-slate-900">Resto U</div>
        <div class="text-[12px] font-medium text-slate-500">Commandes</div>
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

    <section class="mt-2 rounded-[22px] bg-[#1d5d50] p-4 text-white shadow-sm">
      <div class="flex items-center justify-between">
        <div class="flex items-center gap-3">
          <div class="flex h-10 w-10 items-center justify-center rounded-full bg-[#e8e2dd] text-xl text-[#1d5d50]">⏱</div>
          <div>
            <p class="text-[11px] font-black uppercase tracking-[0.16em] text-white/75">Commande active</p>
            <p class="mt-1 text-[20px] font-black tracking-[-0.04em]">#RU-4821</p>
          </div>
        </div>

        <div class="text-right">
          <p class="text-[11px] font-semibold uppercase tracking-[0.12em] text-white/75">Arrivée estimée</p>
          <p class="mt-1 text-[25px] font-black tracking-[-0.05em]">≈ 8 min</p>
        </div>
      </div>

      <div class="mt-4 flex items-center justify-between rounded-[14px] bg-[#214f48] px-3 py-2 text-[13px] text-white/90">
        <div class="flex items-center gap-2">
          <span>⌖</span>
          <span>Repère : Devant l’Amphi 700</span>
        </div>
        <span class="font-bold text-white">Ngoa-Ekélé</span>
      </div>
    </section>

    <section class="mt-5 rounded-[22px] bg-[#f1ece6] p-4 shadow-sm">
      <div class="flex items-center justify-between">
        <h2 class="text-[20px] font-black text-slate-900">Progression en direct</h2>
        <div class="flex items-center gap-2 text-[12px] font-bold text-[#1d5d50]">
          <span class="h-2.5 w-2.5 rounded-full bg-[#1d5d50]"></span>
          <span>En route vers vous</span>
        </div>
      </div>

      <div class="mt-5 space-y-5">
        {#each steps as step}
          <div class="flex items-start gap-3">
            <div class="mt-1 flex h-6 w-6 items-center justify-center rounded-full {step.done ? 'bg-[#1d5d50] text-white' : 'bg-[#e3dcd4] text-slate-500'}">
              {step.done ? '✓' : '•'}
            </div>
            <div class="flex-1 border-b border-slate-200 pb-3">
              <p class="text-[15px] font-bold text-slate-900">{step.label}</p>
              {#if step.done && step.label === 'Restaurant confirme'}
                <p class="mt-1 text-[12px] text-slate-500">Préparation validée à 12h14</p>
              {/if}
              {#if step.label === 'Livreur en route'}
                <p class="mt-1 text-[12px] text-slate-500">Paul a pris votre sachet isotherme</p>
              {/if}
            </div>
          </div>
        {/each}
      </div>

      <div class="mt-3 rounded-[18px] bg-[#f2d5c8] p-3">
        <div class="flex items-start gap-3">
          <div class="flex h-8 w-8 items-center justify-center rounded-full bg-[#d96a3a] text-lg text-white">◉</div>
          <div>
            <h3 class="text-[18px] font-black text-slate-900">Repas en cours d’acheminement</h3>
            <p class="mt-1 text-[13px] text-slate-700">Traverse le carrefour IUT vers l’Amphi 700</p>
          </div>
        </div>
      </div>

      <div class="mt-4 flex items-start gap-3">
        <div class="mt-1 flex h-6 w-6 items-center justify-center rounded-full bg-[#e3dcd4] text-slate-500">✓</div>
        <div class="flex-1">
          <p class="text-[15px] font-bold text-slate-900">Livrée en mains propres</p>
          <p class="mt-1 text-[12px] text-slate-500">Validation par saisie du code OTP</p>
        </div>
      </div>
    </section>

    <section class="mt-5 rounded-[20px] bg-[#f3e4dd] p-4 shadow-sm">
      <div class="flex items-center justify-between gap-2">
        <div class="flex items-center gap-2 text-[18px] font-black text-[#a94a2a]">
          <span>◍</span>
          <span>Votre code de sécurité livraison</span>
        </div>
        <div class="h-8 w-8 rounded-full border-2 border-[#d7b5a6] bg-[#f7ece6]" aria-label="shield"></div>
      </div>

      <div class="mt-4 grid grid-cols-4 gap-2 text-center">
        {#each ['8', '4', '1', '9'] as digit}
          <div class="flex h-14 items-center justify-center rounded-[14px] bg-[#f5f2ee] text-[30px] font-black text-slate-900 shadow-inner">{digit}</div>
        {/each}
      </div>

      <div class="mt-4 rounded-[14px] bg-[#efc7bf] p-3 text-[13px] font-medium leading-5 text-[#7d3d30]">
        Protection Campus : Ne transmettez ces 4 chiffres à Paul qu’une fois votre boîte de repas chaude entre vos mains !
      </div>
    </section>

    <section class="mt-5 rounded-[20px] bg-[#f2efe9] p-3 shadow-sm">
      <div class="flex items-center justify-between gap-3">
        <div class="flex items-center gap-3">
          <div class="h-12 w-12 rounded-full bg-cover bg-center ring-2 ring-white" style="background-image:url('https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=200&q=80')"></div>
          <div>
            <p class="text-[17px] font-black text-slate-900">Paul K.</p>
            <p class="text-[12px] text-slate-500">Livreur Campus Certifié #34</p>
          </div>
        </div>
        <div class="flex items-center gap-1 text-[13px] font-bold text-[#1d5d50]">★ 4.9</div>
      </div>

      <div class="mt-4 flex items-center gap-2 rounded-[14px] bg-[#e3e8e7] p-2">
        <span class="text-[20px]">☎</span>
        <button class="flex-1 rounded-[12px] bg-[#1d5d50] px-3 py-3 text-center text-[18px] font-black text-white">WhatsApp Paul</button>
      </div>
    </section>

    <section class="mt-5 rounded-[18px] bg-[#f3efe9] p-3 shadow-sm">
      <div class="flex items-center justify-between">
        <h3 class="text-[16px] font-black text-slate-900">Détail du panier</h3>
        <span class="text-[12px] font-bold uppercase tracking-[0.14em] text-slate-500">2 articles</span>
      </div>

      <div class="mt-3 space-y-3 text-[14px] text-slate-700">
        <div class="flex items-start justify-between gap-3">
          <div class="flex items-start gap-2">
            <span class="mt-1 inline-block h-3 w-3 rounded-sm border border-slate-400"></span>
            <span class="max-w-[220px] leading-5">1x Poisson braisé complet (Plantains mûrs)</span>
          </div>
          <span class="font-black text-slate-900">2 500 FCFA</span>
        </div>

        <div class="flex items-start justify-between gap-3">
          <div class="flex items-start gap-2">
            <span class="mt-1 inline-block h-3 w-3 rounded-sm border border-slate-400"></span>
            <span class="max-w-[220px] leading-5">1x Jus de Foléré maison (Glacé pilée)</span>
          </div>
          <span class="font-black text-slate-900">500 FCFA</span>
        </div>
      </div>

      <div class="mt-3 flex items-center justify-between border-t border-slate-200 pt-3 text-[14px] text-slate-700">
        <span>Frais de livraison (Amphi 700)</span>
        <span class="font-bold text-slate-900">300 FCFA</span>
      </div>

      <div class="mt-4 rounded-[14px] bg-[#f1d9ca] px-3 py-4 text-[13px] text-[#7d3d30]">
        <div class="flex items-center justify-between gap-2">
          <span class="font-black uppercase tracking-[0.12em]">Total à régler à l’arrivée</span>
          <span class="text-[22px] font-black text-slate-900">3 300 FCFA</span>
        </div>
        <div class="mt-2 flex items-center gap-2 text-[12px] font-semibold">
          <span>◔</span>
          <span>Espèces exactes recommandées</span>
        </div>
      </div>
    </section>

    <button class="mt-5 flex w-full items-center justify-center gap-2 rounded-[18px] bg-[#e5e1d9] px-4 py-3 text-[14px] font-black text-[#1d5d50]">
      <span>⚑</span>
      <span>Signaler un retard ou un problème au Support U</span>
    </button>
  </div>

  <nav class="fixed inset-x-0 bottom-0 mx-auto max-w-[430px] border-t border-slate-200 bg-[#f1f0eb] pb-[calc(env(safe-area-inset-bottom)+8px)] pt-2 shadow-[0_-8px_20px_rgba(15,23,42,0.05)]">
    <div class="grid grid-cols-4 items-center px-3 text-center">
      <div class="flex flex-col items-center gap-1 py-2 text-slate-500">
        <div class="text-2xl">⌂</div>
        <span class="text-[11px]">Cantines</span>
      </div>
      <div class="flex flex-col items-center gap-1 py-2 text-[#eb6a2a]">
        <div class="relative text-2xl">
          ▣
          <span class="absolute -right-1 -top-0.5 flex h-4 min-w-4 items-center justify-center rounded-full bg-[#ef5f39] px-1 text-[9px] font-bold text-white">•</span>
        </div>
        <span class="text-[11px] font-bold">Commandes</span>
      </div>
      <div class="flex flex-col items-center gap-1 py-2 text-slate-500">
        <div class="relative text-2xl">🛒</div>
        <span class="text-[11px]">Panier</span>
      </div>
      <div class="flex flex-col items-center gap-1 py-2 text-slate-500">
        <div class="text-2xl">◌</div>
        <span class="text-[11px]">Compte</span>
      </div>
    </div>
  </nav>
</div>
