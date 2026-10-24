<main class="mx-auto min-h-screen w-full max-w-6xl px-4 py-6 md:px-8 md:py-10">
	<section class="grain-panel fade-up rounded-[2rem] p-5 md:p-10">
		<div class="flex flex-wrap items-start justify-between gap-4 border-b border-[var(--line)] pb-6 md:pb-8">
			<div>
				<p class="text-xs font-bold uppercase tracking-[0.2em] text-[var(--brand)]">Restaurant U</p>
				<h1 class="mt-2 max-w-2xl text-4xl leading-tight text-slate-900 md:text-6xl">
					Mange mieux au campus, sans attendre au comptoir.
				</h1>
			</div>
			<div class="rounded-full border border-[var(--line)] bg-white px-4 py-2 text-xs font-semibold uppercase tracking-[0.14em] text-slate-700">
				PWA + Supabase local
			</div>
		</div>

		<div class="mt-7 grid gap-4 md:mt-9 md:grid-cols-[1.2fr_0.8fr] md:gap-6">
			<div class="fade-up delay-1 rounded-3xl bg-slate-900 p-5 text-slate-100 md:p-7">
				<p class="text-xs uppercase tracking-[0.16em] text-amber-300">Promesse</p>
				<p class="mt-3 text-xl leading-relaxed md:text-2xl">
					Une interface pensée pour Android d’entrée de gamme, avec commandes rapides,
					statuts fiables et suivi des livraisons en temps réel.
				</p>
				<div class="mt-6 flex flex-wrap gap-2 text-xs">
					<span class="rounded-full border border-white/20 px-3 py-1">Client</span>
					<span class="rounded-full border border-white/20 px-3 py-1">Livreur</span>
					<span class="rounded-full border border-white/20 px-3 py-1">Sous-admin</span>
					<span class="rounded-full border border-white/20 px-3 py-1">Admin principal</span>
				</div>
			</div>

			<div class="fade-up delay-2 rounded-3xl border border-[var(--line)] bg-white p-5 md:p-7">
				<p class="text-xs uppercase tracking-[0.16em] text-slate-500">Objectif MVP</p>
				<dl class="mt-4 space-y-4">
					<div class="flex items-end justify-between border-b border-slate-100 pb-3">
						<dt class="text-sm text-slate-600">Temps de charge cible</dt>
						<dd class="text-2xl font-bold text-slate-900">&lt; 3s</dd>
					</div>
					<div class="flex items-end justify-between border-b border-slate-100 pb-3">
						<dt class="text-sm text-slate-600">JavaScript initial</dt>
						<dd class="text-2xl font-bold text-slate-900">&lt; 150 Ko</dd>
					</div>
					<div class="flex items-end justify-between">
						<dt class="text-sm text-slate-600">Disponibilité backend</dt>
						<dd class="text-2xl font-bold text-emerald-700">Local OK</dd>
					</div>
				</dl>
			</div>
		</div>

		<div class="mt-7 grid gap-4 md:grid-cols-3 md:gap-5">
			<article class="rounded-2xl border border-[var(--line)] bg-white p-5">
				<p class="text-xs uppercase tracking-[0.14em] text-slate-500">1. Choix du menu</p>
				<h2 class="mt-2 text-xl text-slate-900">Le client commande</h2>
				<p class="mt-2 text-sm text-slate-600">
					Panier mono-restaurant avec résumé clair du total et des frais de livraison.
				</p>
			</article>

			<article class="rounded-2xl border border-[var(--line)] bg-white p-5">
				<p class="text-xs uppercase tracking-[0.14em] text-slate-500">2. Validation</p>
				<h2 class="mt-2 text-xl text-slate-900">Le resto confirme</h2>
				<p class="mt-2 text-sm text-slate-600">
					Machine à états stricte dans PostgreSQL, avec historique complet des transitions.
				</p>
			</article>

			<article class="rounded-2xl border border-[var(--line)] bg-white p-5">
				<p class="text-xs uppercase tracking-[0.14em] text-slate-500">3. Livraison</p>
				<h2 class="mt-2 text-xl text-slate-900">Le livreur termine</h2>
				<p class="mt-2 text-sm text-slate-600">
					Attribution atomique et code de livraison vérifié avant clôture de commande.
				</p>
			</article>
		</div>

		<div class="mt-7 flex flex-wrap items-center gap-3 rounded-2xl border border-[var(--line)] bg-white p-4 md:p-5">
			<span class="rounded-full bg-amber-100 px-3 py-1 text-xs font-semibold uppercase tracking-[0.14em] text-amber-800">
				Statut
			</span>
			<p class="text-sm text-slate-700 md:text-base">
				Interface refaite. Prochaine étape: écrans d’authentification et de rôles pour la phase 1.
			</p>
		</div>
	</section>
</main>
