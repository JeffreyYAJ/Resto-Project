<script lang="ts">
	import '../app.css';
	import favicon from '#lib/assets/favicon.svg';
	import type { LayoutProps } from './$types';

	let { children }: LayoutProps = $props();

	const navItems = [
		{ href: '/', label: 'Accueil' },
		{ href: '/restaurants', label: 'Restaurants' },
		{ href: '/panier', label: 'Panier' },
		{ href: '/commandes', label: 'Commandes' }
	];
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
	<meta name="theme-color" content="#f59e0b" />
</svelte:head>

<div class="mx-auto min-h-screen max-w-6xl">
	<header class="sticky top-0 z-20 border-b border-slate-200/80 bg-[#f7f2e9]/90 backdrop-blur-sm">
		<div class="mx-auto flex max-w-5xl items-center justify-between px-4 py-3 md:px-6">
			<a href="/" class="flex items-center gap-3">
				<div class="flex h-10 w-10 items-center justify-center rounded-2xl bg-amber-500 text-lg font-black text-white">U</div>
				<div>
					<p class="text-[10px] font-bold uppercase tracking-[0.18em] text-slate-500">Campus</p>
					<p class="text-sm font-semibold text-slate-900">Restaurant U</p>
				</div>
			</a>

			<nav class="hidden items-center gap-2 md:flex">
				{#each navItems as item}
					<a href={item.href} class="rounded-full px-3 py-2 text-sm font-medium text-slate-600 transition hover:bg-white hover:text-slate-900">{item.label}</a>
				{/each}
			</nav>

			<a href="/auth" class="rounded-full bg-slate-900 px-3 py-2 text-sm font-semibold text-white">Mon compte</a>
		</div>
	</header>

	{@render children()}

	<nav class="fixed inset-x-0 bottom-0 z-30 border-t border-slate-200 bg-white/90 backdrop-blur-sm md:hidden">
		<div class="mx-auto grid max-w-md grid-cols-4 gap-1 px-2 py-2">
			{#each navItems as item}
				<a href={item.href} class="rounded-2xl px-2 py-2 text-center text-[11px] font-medium text-slate-600 hover:bg-slate-100">
					{item.label}
				</a>
			{/each}
		</div>
	</nav>
</div>
