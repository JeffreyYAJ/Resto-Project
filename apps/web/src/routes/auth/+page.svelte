<main class="mx-auto min-h-screen max-w-md px-4 py-8 text-slate-800">
  <div class="rounded-[2rem] border border-slate-200 bg-white/90 p-5 shadow-sm backdrop-blur-sm">
    <div class="mb-6 flex items-center justify-between">
      <div>
        <p class="text-xs font-bold uppercase tracking-[0.2em] text-amber-600">Restaurant U</p>
        <h1 class="mt-2 text-3xl font-bold text-slate-900">Connexion</h1>
      </div>
      <a href="/" class="text-sm font-medium text-slate-500">Retour</a>
    </div>

    <div class="mb-6 grid grid-cols-2 gap-2 rounded-2xl bg-slate-100 p-1">
      <button class="rounded-xl bg-white px-3 py-2 text-sm font-semibold text-slate-900 shadow-sm">Client</button>
      <button class="rounded-xl px-3 py-2 text-sm font-medium text-slate-500">Livreur</button>
    </div>

    <form class="space-y-4">
      <label class="block">
        <span class="mb-1 block text-sm font-medium text-slate-600">Identifiant</span>
        <input
          value="3A17"
          class="w-full rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3 text-base outline-none ring-0 transition focus:border-amber-400 focus:bg-white"
        />
      </label>

      <label class="block">
        <span class="mb-1 block text-sm font-medium text-slate-600">Mot de passe</span>
        <input
          type="password"
          value="••••••••"
          class="w-full rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3 text-base outline-none ring-0 transition focus:border-amber-400 focus:bg-white"
        />
      </label>

      <div class="flex items-center justify-between text-sm text-slate-500">
        <label class="inline-flex items-center gap-2">
          <input type="checkbox" checked class="h-4 w-4 rounded border-slate-300 text-amber-600" />
          Se souvenir de moi
        </label>
        <a href="/" class="font-medium text-amber-700">Mot de passe oublié</a>
      </div>

      <a href="/restaurants" class="mt-2 block w-full rounded-2xl bg-slate-900 px-4 py-3 text-center text-base font-semibold text-white shadow-sm">Se connecter</a>
      <button type="button" class="w-full rounded-2xl border border-slate-200 bg-white px-4 py-3 text-base font-semibold text-slate-700">Créer un compte</button>
    </form>
  </div>
</main>
