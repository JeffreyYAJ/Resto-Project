<script lang="ts">
	const filters = [
		{ label: 'Toutes', active: true },
		{ label: 'Ouvertes maintenant', active: false },
		{ label: 'Pla1', active: false }
	];

	const featuredRestaurant = {
		name: 'Ndóle Royal & Plantains',
		description: 'Viande de boeuf fondante, crevettes fraîches, plantains mûrs...',
		price: '1200 FCFA',
		image:
			'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=900&q=80'
	};

	const restaurants = [
		{
			name: 'Cantine Centrale',
			rate: 4.8,
			location: 'Ngoa-Ekélé Centre • Amphi 700',
			time: '15 - 25 min',
			fee: 'Dès 600 FCFA',
			speciality: 'SPÉCIALITÉS CE MIDI\nNdolé plantains mûrs, Riz sauc...',
			image:
				'https://images.unsplash.com/photo-1547592180-85f173990554?auto=format&fit=crop&w=900&q=80'
		},
		{
			name: 'Chez Maman Chantal',
			rate: 4.9,
			location: 'Annexe FMSB • Porte 4',
			time: '10 - 20 min',
			fee: 'Dès 700 FCFA',
			speciality: 'SPÉCIALITÉS CE MIDI\nPoisson braisé pimenté, Éru & ...',
			image:
				'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=900&q=80'
		},
		{
			name: 'Le Gourmet Univers...',
			rate: 4.6,
			location: 'Amphi 300 • Pavillon 0',
			time: '10 - 15 min',
			fee: 'Dès 500 FCFA',
			speciality: 'SPÉCIALITÉS CE MIDI\nBeignets-Haricots (BHB), Spa...',
			image:
				'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=900&q=80'
		}
	];
</script>

<div class="mx-auto min-h-screen bg-[#f2efe9] px-4 pb-20 pt-2 text-slate-800">
	<div class="mx-auto max-w-[430px] bg-[#f0eee7]">
		<header class="flex items-center justify-between pb-2 pt-3">
			<div class="flex items-center gap-2">
				<div class="flex h-10 w-10 items-center justify-center rounded-xl border border-slate-300 bg-white text-[10px] font-bold text-slate-700">
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

		<section class="mt-2 flex items-center gap-3 rounded-[26px] bg-[#f3d4c5] p-3 text-slate-900 shadow-sm">
			<div class="flex h-10 w-10 items-center justify-center rounded-full bg-[#f08d52] text-lg text-white">◔</div>
			<div class="flex-1">
				<p class="text-[12px] font-black uppercase tracking-[0.18em] text-[#a54d26]">Heure de pointe</p>
				<p class="mt-1 text-[12px] leading-5 text-slate-800">
					Commande avant <span class="font-bold">11h45</span> pour être livré avant le <span class="font-bold">TD de 13h</span> !
				</p>
			</div>
		</section>

		<section class="mt-4 flex items-center gap-3 rounded-[20px] bg-[#efeae3] px-3 py-2 shadow-sm">
			<span class="text-xl text-slate-500">⌕</span>
			<input value="Koki, Ndolé, Eru, cantine..." class="w-full border-0 bg-transparent text-[14px] text-slate-500 outline-none" />
			<span class="text-xl text-slate-600">☰</span>
		</section>

		<section class="mt-4 grid grid-cols-[1fr_1fr_0.8fr] gap-2">
			{#each filters as filter}
				<button class="rounded-[18px] px-2 py-2 text-[13px] font-semibold {filter.active ? 'bg-[#1f5d51] text-white shadow-sm' : 'bg-[#e7e2dc] text-slate-700'}">
					{filter.label}
				</button>
			{/each}
		</section>

		<section class="mt-5 rounded-[24px] bg-[#f0e9e2] p-3 shadow-sm">
			<div class="mb-2 flex items-center justify-between text-[12px] text-slate-700">
				<div class="flex items-center gap-2 font-semibold">
					<span class="text-[#1d5b4c]">◌</span>
					<span>Plat Vedette du Midi</span>
				</div>
				<span class="font-bold text-[#1d5b4c]">★ 4.9</span>
			</div>

			<div class="flex gap-3">
				<img src={featuredRestaurant.image} alt={featuredRestaurant.name} class="h-28 w-28 rounded-[18px] object-cover" />
				<div class="flex-1">
					<h2 class="text-[19px] font-extrabold leading-tight text-slate-900">{featuredRestaurant.name}</h2>
					<p class="mt-1 text-[13px] leading-5 text-slate-600">{featuredRestaurant.description}</p>
					<p class="mt-2 text-[22px] font-black tracking-[-0.04em] text-slate-900">{featuredRestaurant.price}</p>
				</div>
			</div>
			<button class="mt-4 flex w-full items-center justify-center gap-2 rounded-[18px] bg-[#f08b46] px-4 py-3 text-base font-black text-white shadow-sm">
				<span>🛒</span>
				Ajouter au panier (1 200 FCFA)
			</button>
		</section>

		<section class="mt-5 flex items-center justify-between rounded-[18px] bg-[#e4e6df] px-4 py-4 shadow-sm">
			<div class="flex items-center gap-3">
				<div class="flex h-9 w-9 items-center justify-center rounded-full bg-[#1b5c4d] text-white">✦</div>
				<div>
					<p class="text-[13px] text-slate-600">Livraison express campus</p>
					<p class="text-[15px] font-bold text-slate-900">Amphis, Facultés, Cités U (Ngoa-Ekélé)</p>
				</div>
			</div>
			<div class="text-[18px] font-black text-slate-900">300 FCFA</div>
		</section>

		<section class="mt-5">
			<div class="mb-3 flex items-center gap-2">
				<div class="text-[26px] text-[#1f5d51]">◫</div>
				<h3 class="text-[22px] font-black text-slate-900">Cantines Ouvertes</h3>
				<span class="text-[12px] font-semibold text-slate-500">3 établissements actifs</span>
			</div>

			{#each restaurants as restaurant}
				<article class="mb-4 rounded-[22px] bg-[#f0eae3] p-3 shadow-sm">
					<div class="flex gap-3">
						<img src={restaurant.image} alt={restaurant.name} class="h-20 w-20 rounded-[16px] object-cover" />
						<div class="flex-1">
							<div class="flex items-start justify-between gap-2">
								<h4 class="text-[18px] font-black text-slate-900">{restaurant.name}</h4>
								<span class="text-[13px] font-bold text-[#1d5b4c]">★ {restaurant.rate}</span>
							</div>

							<div class="mt-1 flex items-center gap-2 text-[12px] text-slate-600">
								<span>◉</span>
								<span>{restaurant.location}</span>
							</div>

							<div class="mt-2 flex items-center justify-between text-[13px]">
								<span class="rounded-full bg-[#dfeae5] px-2 py-1 font-bold text-[#1d5b4c]">{restaurant.time}</span>
								<span class="font-bold text-[#1d5b4c]">{restaurant.fee}</span>
							</div>
						</div>
					</div>

					<div class="mt-3 flex items-center justify-between rounded-[14px] bg-[#dfe8e5] px-3 py-2">
						<p class="text-[11px] uppercase tracking-[0.1em] text-slate-600">{restaurant.speciality.split('\n')[0]}</p>
						<button class="rounded-[12px] bg-[#1f5d51] px-4 py-2 text-[13px] font-bold text-white">Voir carte →</button>
					</div>
				</article>
			{/each}
		</section>

		<section class="mt-3 rounded-[18px] bg-[#e7e7e0] p-3 shadow-sm">
			<div class="flex items-center justify-between gap-4">
				<div class="flex items-center gap-3">
					<div class="flex h-10 w-10 items-center justify-center rounded-full border border-slate-400 text-lg text-slate-700">◫</div>
					<div>
						<p class="text-[12px] uppercase tracking-[0.14em] text-slate-500">Paiement Mobile</p>
						<p class="text-[15px] font-bold text-slate-900">Orange Money • MTN MoMo</p>
					</div>
				</div>
				<div class="text-[12px] text-slate-600">Espèces au livreur</div>
			</div>
		</section>
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
</div>
