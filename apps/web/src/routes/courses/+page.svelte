<script lang="ts">
  const statusText = ['#34 PAUL K.', 'EN SERVICE'];

  const routeSummary = {
    location: 'Ngoa-Ekélé',
    sector: 'Campus Principal • UY1',
    rating: '82%',
    badge: 'Ede • 3G Campus',
    quota: 'Quota : 12 / 18'
  };

  const currentCourse = {
    title: 'Cantine Centrale',
    code: '#RU-4821',
    timer: '39s',
    pickup: 'Retrait',
    pickupPlace: 'Comptoir Cantine Centrale UY1',
    delivery: 'Livraison',
    deliveryPlace: 'Faculté des Sciences (Amphi 700 / Salle C12)',
    amount: '270 FCFA',
    customerAmount: '3300 FCFA',
    isothermal: '1 sac isotherme scellé',
    order: 'Poisson braisé + Bâtman moi + Jus de Folé...'
  };

  const jobs = [
    {
      departure: 'Départ immédiat avant 12h30',
      fee: '270 F',
      restaurant: 'Chez Maman Chantal',
      area: 'Amphie FMSB • Porte 4',
      distance: '≈ 550m',
      method: 'Déjà réglé',
      payment: 'MoMo',
      tag: 'Prendre →'
    },
    {
      departure: 'Départ avant 12h40',
      fee: '270 F',
      restaurant: 'Le Gourmet Universitaire',
      area: 'Amphi 300 • Pavillon D',
      distance: '≈ 380m',
      method: 'Espèces : 2',
      payment: '400 F',
      tag: 'Prendre →'
    }
  ];
</script>

<div class="mx-auto min-h-screen max-w-[430px] bg-[#f3efe9] px-4 pb-28 pt-3 text-[#1d1d1a]">
  <header class="flex items-center justify-between gap-3">
    <div class="flex items-center gap-2 rounded-[10px] border border-[#2d6a5a] bg-[#2d6a5a] px-2 py-1.5 text-[11px] font-black uppercase tracking-[0.1em] text-white">
      <span>#34</span>
      <span>Paul K.</span>
    </div>

    <div class="flex items-center gap-2 rounded-[10px] border border-[#dfe9df] bg-[#eaf0e9] px-2 py-1.5 text-[10px] font-black uppercase tracking-[0.12em] text-[#1f5d51]">
      <span>●</span>
      <span>En service</span>
    </div>

    <div class="ml-auto flex items-center gap-2">
      <div class="rounded-[16px] bg-[#e8f0ea] px-2 py-1 text-[11px] font-black uppercase tracking-[0.08em] text-[#1f5d51]">
        Gains jour
      </div>
      <div class="flex items-center gap-2 rounded-full bg-[#f2e1e1] px-2 py-1.5 text-[16px] font-black text-[#1d1d1a]">
        <span>8750 F</span>
      </div>
      <div class="flex h-10 w-10 items-center justify-center rounded-full bg-[#f6b9b8] text-[24px] text-[#1d1d1a]">✦</div>
      <div class="flex h-10 w-10 items-center justify-center rounded-full bg-[#1f5d51] text-lg font-black text-white shadow-sm">◌</div>
    </div>
  </header>

  <section class="mt-4 rounded-[18px] border border-[#d9d3ce] bg-[#eeece8] px-3 py-3 shadow-sm">
    <div class="flex items-center justify-between gap-3">
      <div class="flex items-center gap-2 text-[15px] font-bold text-[#1d1d1a]">
        <span class="inline-flex h-4 w-4 items-center justify-center rounded-full bg-[#1f5d51] text-[8px] text-white">•</span>
        <span>{routeSummary.location}</span>
      </div>
      <div class="flex h-7 w-7 items-center justify-center rounded-full bg-[#1d5d50] text-sm text-white">◔</div>
    </div>

    <div class="mt-2 flex items-center justify-between text-[12px] font-medium text-slate-600">
      <div class="flex items-center gap-2">
        <span>📍</span>
        <span>{routeSummary.sector}</span>
      </div>
      <div class="rounded-full bg-[#e1e6e2] px-2 py-1 text-[10px] font-bold uppercase tracking-[0.1em] text-[#1f5d51]">{routeSummary.rating}</div>
    </div>

    <div class="mt-3 flex items-center justify-between gap-4 text-[12px] font-medium text-slate-600">
      <div class="flex items-center gap-2">
        <span>🧭</span>
        <span>{routeSummary.badge}</span>
      </div>
      <div class="flex items-center gap-2">
        <span>🧺</span>
        <span>{routeSummary.quota}</span>
      </div>
    </div>

    <div class="mt-3 h-2 rounded-full bg-[#d9d2cc]">
      <div class="h-2 w-[55%] rounded-full bg-[#ef6a35]"></div>
    </div>
  </section>

  <section class="mt-4 rounded-[18px] bg-[#edebe7] p-3 shadow-sm">
    <div class="flex items-center justify-between">
      <div class="flex items-center gap-2 text-[18px] font-black text-[#1d1d1a]">
        <span>COURSE IMMÉDIATE</span>
        <span class="text-[12px] font-bold text-[#1f5d51]">{currentCourse.code}</span>
      </div>
      <div class="flex items-center gap-1 rounded-full bg-[#f0d8d4] px-2 py-1 text-[14px] font-black text-[#8f4d3d]">
        <span>◔</span>
        <span>{currentCourse.timer}</span>
      </div>
    </div>

    <h2 class="mt-2 text-[32px] font-black leading-none tracking-[-0.06em] text-[#1d1d1a]">{currentCourse.title}</h2>

    <div class="mt-4 space-y-3 rounded-[14px] bg-[#f2e4df] p-3">
      <div class="flex items-start gap-3">
        <div class="mt-1 flex h-8 w-8 items-center justify-center rounded-full bg-[#d9efe9] text-lg text-[#1f5d51]">◫</div>
        <div class="flex-1">
          <p class="text-[12px] font-bold uppercase tracking-[0.14em] text-slate-500">{currentCourse.pickup}</p>
          <p class="text-[15px] font-black text-[#1d1d1a]">{currentCourse.pickupPlace}</p>
        </div>
      </div>

      <div class="flex items-start gap-3">
        <div class="mt-1 flex h-8 w-8 items-center justify-center rounded-full bg-[#d9efe9] text-lg text-[#1f5d51]">◍</div>
        <div class="flex-1">
          <p class="text-[12px] font-bold uppercase tracking-[0.14em] text-slate-500">{currentCourse.delivery}</p>
          <p class="text-[15px] font-black text-[#1d1d1a]">{currentCourse.deliveryPlace}</p>
        </div>
      </div>
    </div>

    <div class="mt-4 grid grid-cols-2 gap-2">
      <div class="rounded-[12px] bg-[#ede6df] p-3">
        <p class="text-[12px] font-bold uppercase tracking-[0.12em] text-slate-500">Gain livreur net</p>
        <div class="mt-2 flex items-end gap-2">
          <span class="text-[29px] font-black leading-none text-[#1d1d1a]">270</span>
          <span class="pb-1 text-[14px] font-bold uppercase text-[#1d1d1a]">FCFA</span>
        </div>
        <p class="mt-2 text-[12px] font-medium text-slate-500">90% de 300 F (10% com.)</p>
      </div>

      <div class="rounded-[12px] bg-[#ebefe9] p-3">
        <p class="text-[12px] font-bold uppercase tracking-[0.12em] text-slate-500">À encaisser client</p>
        <div class="mt-2 flex items-end gap-2">
          <span class="text-[29px] font-black leading-none text-[#1d1d1a]">3 300</span>
          <span class="pb-1 text-[14px] font-bold uppercase text-[#1d1d1a]">FCFA</span>
        </div>
        <p class="mt-2 text-[12px] font-medium text-slate-500">Espèces au comptoir</p>
      </div>
    </div>

    <div class="mt-4 rounded-[12px] bg-[#e2e9e6] p-3">
      <div class="flex items-center gap-3">
        <div class="flex h-8 w-8 items-center justify-center rounded-full bg-[#d9efe9] text-lg text-[#1f5d51]">◫</div>
        <div>
          <p class="text-[14px] font-black text-[#1d1d1a]">{currentCourse.isothermal}</p>
          <p class="text-[13px] text-slate-600">{currentCourse.order}</p>
        </div>
      </div>
    </div>

    <button class="mt-4 flex w-full items-center justify-center rounded-[16px] bg-[#1e5f53] px-4 py-3 text-[18px] font-black text-white shadow-sm">
      ✔ Accepter la course (270 FCFA)
    </button>

    <button class="mt-3 flex w-full items-center justify-center rounded-[14px] bg-[#e7e6e3] px-4 py-3 text-[18px] font-black text-[#1d1d1a]">
      ✕ Décliner cette course
    </button>
  </section>

  <section class="mt-5 rounded-[16px] bg-[#efd7c2] px-3 py-3 shadow-sm">
    <div class="flex items-start gap-3">
      <div class="mt-1 flex h-9 w-9 items-center justify-center rounded-full bg-[#f2c09e] text-lg text-[#1d1d1a]">⏰</div>
      <p class="text-[14px] font-black leading-6 text-[#1d1d1a]">
        Forte demande sur la Faculté des Arts et Sciences. Restez à proximité du carrefour IUT pour enchainer les livraisons.
      </p>
    </div>
  </section>

  <section class="mt-5">
    <div class="mb-3 flex items-center justify-between">
      <div class="flex items-center gap-2 text-[22px] font-black text-[#1d1d1a]">
        <span>Courses disponibles</span>
        <span class="text-[18px] text-[#1f5d51]">2</span>
      </div>
      <span class="text-[12px] font-semibold text-slate-600">Secteur Ngoa-Ekélé</span>
    </div>

    {#each jobs as job}
      <article class="mb-3 rounded-[16px] border border-[#d9d0c6] bg-[#f1eee8] p-3 shadow-sm">
        <div class="flex items-center justify-between gap-2">
          <div class="flex items-center gap-2 text-[14px] font-bold text-[#1d1d1a]">
            <span>◔</span>
            <span>{job.departure}</span>
          </div>
          <div class="text-[18px] font-black text-[#1d1d1a]">{job.fee}</div>
        </div>

        <div class="mt-3 flex items-center gap-3 text-[18px] font-black text-[#1d1d1a]">
          <span>▣</span>
          <span>{job.restaurant}</span>
        </div>

        <div class="mt-2 flex items-center gap-2 text-[14px] font-medium text-slate-600">
          <span>◉</span>
          <span>{job.area}</span>
        </div>

        <div class="mt-3 flex items-center justify-between gap-3 text-[13px] text-slate-700">
          <div class="flex items-center gap-2">
            <span>↗</span>
            <span>Distance :</span>
            <span class="font-black text-[#1d1d1a]">{job.distance}</span>
          </div>

          <div class="flex items-center gap-2 rounded-full bg-[#e7e5e3] px-2 py-1 font-semibold text-slate-700">
            <span>•</span>
            <span>{job.method}</span>
            <span class="font-black text-[#1d1d1a]">({job.payment})</span>
          </div>
        </div>

        <div class="mt-3 flex justify-end">
          <button class="rounded-[12px] bg-[#e7e5e3] px-4 py-2 text-[15px] font-black text-[#1d1d1a]">{job.tag}</button>
        </div>
      </article>
    {/each}
  </section>

  <section class="mt-5 rounded-[16px] border border-[#d9d0c6] bg-[#f1eee8] p-3 shadow-sm">
    <div class="flex items-center justify-between">
      <div class="flex items-center gap-2 text-[18px] font-black text-[#1d1d1a]">
        <span>Courses livrées aujourd’hui</span>
        <span class="text-[18px] text-[#1f5d51]">12 courses (+3240F)</span>
      </div>
      <div class="flex h-9 w-9 items-center justify-center rounded-full bg-[#dfe7df] text-[18px] text-[#1f5d51]">⚙</div>
    </div>
  </section>

  <nav class="fixed inset-x-0 bottom-0 z-50 mx-auto max-w-[430px] border-t border-[#d8d0c9] bg-[#f3efe9] pb-[calc(env(safe-area-inset-bottom)+10px)] pt-2 shadow-[0_-8px_18px_rgba(0,0,0,0.05)]">
    <div class="grid grid-cols-4 items-center text-center">
      <div class="flex flex-col items-center gap-1 py-2 text-slate-600">
        <div class="text-[26px]">⟡</div>
        <span class="text-[12px] font-medium">Courses</span>
      </div>
      <div class="flex flex-col items-center gap-1 py-2 text-slate-600">
        <div class="text-[26px]">⇢</div>
        <span class="text-[12px] font-medium">En cours</span>
      </div>
      <div class="flex flex-col items-center gap-1 py-2 text-slate-600">
        <div class="text-[26px]">◫</div>
        <span class="text-[12px] font-medium">Gains &amp; Cash</span>
      </div>
      <div class="flex flex-col items-center gap-1 py-2 text-slate-600">
        <div class="text-[26px]">◌</div>
        <span class="text-[12px] font-medium">Profil</span>
      </div>
    </div>
  </nav>
</div>
