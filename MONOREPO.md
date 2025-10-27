# DataMind Core - Nx Monorepo

Vítejte v DataMind Core monorepo! Tento projekt používá Nx pro správu více aplikací a sdílených knihoven.

## 📁 Struktura projektu

```
datamind-core/
├── apps/
│   ├── datamind-pwa/        # Progressive Web App (SvelteKit + Vite)
│   └── datamind-mobile/     # Mobilní aplikace (Capacitor)
├── packages/                 # Sdílené knihovny (připraveno pro budoucí použití)
├── .devcontainer/           # GitHub Codespaces konfigurace
├── .github/
│   └── workflows/
│       └── ci.yml           # CI/CD pipeline
├── nx.json                  # Nx konfigurace
├── pnpm-workspace.yaml      # pnpm workspace definice
└── package.json             # Root dependencies

```

## 🚀 Rychlý start

### Prerequisity

- **Node.js 22 LTS** (nainstalováno v Codespaces)
- **pnpm 10+** (nainstalováno globálně)
- **GitHub CLI** (pro práci s issues a PR)

### Instalace dependencies

```bash
pnpm install
```

### Spuštění vývojového serveru

```bash
# PWA aplikace
pnpm exec nx serve datamind-pwa

# Přístup na http://localhost:5173
```

### Build projektů

```bash
# Build jedné aplikace
pnpm exec nx build datamind-pwa

# Build všech projektů
pnpm exec nx run-many -t build --all
```

## 📦 Aplikace

### datamind-pwa

Progressive Web App postavená na:
- **SvelteKit 4.2** - Reaktivní framework
- **Vite 5.4** - Build tool
- **TypeScript 5.9** - Type safety

**Dostupné příkazy:**
```bash
pnpm exec nx serve datamind-pwa    # Dev server (port 5173)
pnpm exec nx build datamind-pwa    # Production build
pnpm exec nx preview datamind-pwa  # Preview buildu (port 4173)
pnpm exec nx check datamind-pwa    # Type checking
```

**Build výstup:** `dist/apps/datamind-pwa/`

### datamind-mobile

Mobilní aplikace využívající Capacitor pro Android/iOS:
- **Capacitor 6.0** - Native wrapper
- **webDir:** Používá build z `datamind-pwa`

**Dostupné příkazy:**
```bash
pnpm exec nx sync datamind-mobile  # Synchronizace web assets do native projektů
```

**Konfigurace:** `apps/datamind-mobile/capacitor.config.ts`

## 🛠️ Nx příkazy

### Zobrazení projektů

```bash
# Seznam všech projektů
pnpm exec nx show projects

# Graf závislostí
pnpm exec nx graph
```

### Spouštění tasků

```bash
# Jeden projekt
pnpm exec nx <target> <project>

# Více projektů
pnpm exec nx run-many -t <target> --all

# Pouze změněné projekty
pnpm exec nx affected -t <target>
```

### Caching

Nx automaticky cachuje výsledky tasků. Pro vyčištění cache:

```bash
pnpm exec nx reset
```

## 🧪 Testování

```bash
# Type checking
pnpm exec nx check datamind-pwa

# Lint (připraveno)
pnpm exec nx lint datamind-pwa

# Unit testy (připraveno)
pnpm exec nx test datamind-pwa
```

## 🔧 Vývoj v Codespaces

Projekt je optimalizován pro GitHub Codespaces:

1. **Automatický setup** - Dev container s Node.js 22, pnpm, GitHub CLI
2. **Extensions** - Svelte, Prettier, Copilot předinstalovány
3. **Port forwarding** - Automatický forward portů 5173, 4173

### První spuštění

Po otevření Codespace:

```bash
# Dependencies jsou automaticky nainstalovány
# Pokud ne, spusťte:
pnpm install

# Spusťte dev server
pnpm exec nx serve datamind-pwa
```

## 📝 Workflow

### Vytvoření nové feature

```bash
# 1. Vytvořte branch z develop
git checkout develop
git pull
git checkout -b feature/nazev-featury

# 2. Proveďte změny a testujte
pnpm exec nx serve datamind-pwa

# 3. Build a check před commitem
pnpm exec nx build datamind-pwa
pnpm exec nx check datamind-pwa

# 4. Commit a push
git add .
git commit -m "feat: popis změny"
git push -u origin feature/nazev-featury

# 5. Vytvořte PR
gh pr create --base develop
```

### Přidání nové sdílené knihovny

```bash
# Vytvořte složku v packages/
mkdir -p packages/moje-knihovna

# Přidejte package.json
cd packages/moje-knihovna
pnpm init

# Přidejte Nx project.json
# (viz existující projekty pro referenci)
```

## 🚢 CI/CD

GitHub Actions automaticky:
- ✅ Instaluje dependencies
- ✅ Builduje všechny projekty
- ✅ Spouští type checking
- ✅ Cachuje pnpm store

**Workflow:** `.github/workflows/ci.yml`

### Spouštění

CI se spustí při:
- Push do `develop` nebo `main`
- Pull requestu do `develop` nebo `main`

## 📚 Dokumentace

### Technologie

- [Nx Documentation](https://nx.dev) - Monorepo management
- [pnpm](https://pnpm.io) - Package manager
- [Svelte](https://svelte.dev) - Frontend framework
- [Vite](https://vitejs.dev) - Build tool
- [Capacitor](https://capacitorjs.com) - Mobile wrapper
- [TypeScript](https://www.typescriptlang.org) - Type system

### Struktura souborů

#### Root konfigurace

- `nx.json` - Nx workspace konfigurace, cache nastavení
- `pnpm-workspace.yaml` - pnpm workspace definice
- `package.json` - Root dependencies a skripty
- `.prettierrc` - Code formatting pravidla
- `.gitignore` - Ignorované soubory

#### Aplikace konfigurace

Každý projekt v `apps/` má:
- `project.json` - Nx project konfigurace (targets, dependencies)
- `package.json` - Project-specific dependencies
- Vlastní build konfigurace (vite.config.js, tsconfig.json)

## 🔍 Troubleshooting

### pnpm install selže

```bash
# Vyčistěte cache
pnpm store prune
rm -rf node_modules
rm pnpm-lock.yaml

# Reinstalujte
pnpm install
```

### Nx cache problémy

```bash
# Vyresetujte Nx cache
pnpm exec nx reset
```

### Build selže

```bash
# Zkontrolujte type errors
pnpm exec nx check datamind-pwa

# Vyčistěte a znovu buildněte
rm -rf dist
pnpm exec nx build datamind-pwa
```

### Port už používán

```bash
# Změňte port v apps/datamind-pwa/vite.config.js
# nebo ukončete proces používající port
lsof -ti:5173 | xargs kill -9
```

## 🤝 Přispívání

1. Fork repozitář
2. Vytvořte feature branch
3. Commitujte změny
4. Push do branché
5. Vytvořte Pull Request

### Commit konvence

Používáme [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` - Nová funkce
- `fix:` - Oprava bugu
- `docs:` - Změny v dokumentaci
- `chore:` - Maintenance úkoly
- `refactor:` - Refactoring kódu
- `test:` - Přidání testů
- `ci:` - Změny v CI/CD

### Code review

- Všechny PR musí projít code review
- CI musí projít bez chyb
- Type checking musí být čistý

## 📄 Licence

Apache 2.0 - viz [LICENSE](LICENSE)

## 👥 Tým

- **DigiLifeHub** - [GitHub](https://github.com/DigiLifeHub)

## 🆘 Podpora

- [GitHub Issues](https://github.com/DigiLifeHub/datamind-core/issues)
- [GitHub Discussions](https://github.com/DigiLifeHub/datamind-core/discussions)

---

**Status:** 🚧 Active Development  
**Version:** 0.1.0  
**Last Updated:** October 27, 2025
