<main class="mx-auto min-h-screen max-w-5xl px-4 pb-24 pt-6 text-slate-800 md:px-6">
	<section class="rounded-[2.5rem] border border-slate-200 bg-white/90 p-5 shadow-sm backdrop-blur-sm">
		<div class="flex items-center justify-between">
			<div>
				<p class="text-xs font-bold uppercase tracking-[0.2em] text-amber-600">Restaurant U</p>
				<h1 class="mt-3 text-4xl font-black text-slate-900 md:text-5xl">Mangez bien au campus.</h1>
			</div>
			<div class="hidden rounded-full bg-slate-900 px-3 py-2 text-xs font-semibold uppercase tracking-[0.14em] text-white md:block">PWA</div>
		</div>

		<div class="mt-6 grid gap-4 md:grid-cols-[1.3fr_0.7fr]">
			<div class="rounded-[2rem] bg-slate-900 p-5 text-white md:p-6">
				<p class="text-xs uppercase tracking-[0.18em] text-amber-300">Parcours client</p>
				<p class="mt-3 text-xl leading-relaxed md:text-2xl">
					Commandez vite, suivez votre livraison et payez sans friction depuis votre téléphone.
				</p>
				<div class="mt-5 flex flex-wrap gap-2">
					<a href="/auth" class="rounded-full bg-amber-400 px-4 py-2 text-sm font-semibold text-slate-900">Se connecter</a>
					<a href="/restaurants" class="rounded-full border border-white/20 px-4 py-2 text-sm font-semibold text-white">Voir les restaurants</a>
				</div>
			</div>

			<div class="rounded-[2rem] border border-slate-200 bg-slate-50 p-5">
				<p class="text-xs uppercase tracking-[0.18em] text-slate-500">Aujourd’hui</p>
				<div class="mt-4 space-y-4">
					<div class="flex items-end justify-between border-b border-slate-200 pb-3">
						<span class="text-sm text-slate-500">Commandes actives</span>
						<strong class="text-2xl font-bold text-slate-900">24</strong>
					</div>
					<div class="flex items-end justify-between border-b border-slate-200 pb-3">
						<span class="text-sm text-slate-500">Livraisons à l’heure</span>
						<strong class="text-2xl font-bold text-emerald-600">96%</strong>
					</div>
					<div class="flex items-end justify-between">
						<span class="text-sm text-slate-500">Frais moyens</span>
						<strong class="text-2xl font-bold text-slate-900">500 FCFA</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="mt-8 grid gap-4 md:grid-cols-3">
			<article class="rounded-[1.75rem] border border-slate-200 bg-white p-5">
				<p class="text-xs uppercase tracking-[0.14em] text-slate-500">01</p>
				<h2 class="mt-3 text-xl font-bold text-slate-900">Découvrir</h2>
				<p class="mt-2 text-sm leading-6 text-slate-600">Liste des restaurants, filtres rapides, notes et délais de livraison visibles.</p>
			</article>
			<article class="rounded-[1.75rem] border border-slate-200 bg-white p-5">
				<p class="text-xs uppercase tracking-[0.14em] text-slate-500">02</p>
				<h2 class="mt-3 text-xl font-bold text-slate-900">Commander</h2>
				<p class="mt-2 text-sm leading-6 text-slate-600">Panier mono-restaurant, livraison détaillée et validation simple sur mobile.</p>
			</article>
			<article class="rounded-[1.75rem] border border-slate-200 bg-white p-5">
				<p class="text-xs uppercase tracking-[0.14em] text-slate-500">03</p>
				<h2 class="mt-3 text-xl font-bold text-slate-900">Suivre</h2>
				<p class="mt-2 text-sm leading-6 text-slate-600">Statuts, ETA et code de livraison pour sécuriser la clôture de commande.</p>
			</article>
		</div>
	</section>
</main>
