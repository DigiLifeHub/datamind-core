# DataMind Core

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![CI Build](https://github.com/digilifehub/datamind-core/actions/workflows/ci.yml/badge.svg)](https://github.com/digilifehub/datamind-core/actions/workflows/ci.yml)
[![Open in GitHub Codespaces](https://github.com/badges/codespaces.svg)](https://codespaces.new/digilifehub/datamind-core)

DataMind Core je open-source, local-first platforma, která propojuje svět vašich myšlenek (Markdown) se světem vašich dat (SQLite).

Proč si jen propojovat poznámky, když se na ně můžete dotazovat? DataMind je postaven na filozofii, že váš systém pro správu osobních znalostí by měl zvládat nestrukturovaný text i strukturovaná data se stejnou elegancí. Je to váš osobní, dotazovatelný dashboard pro život.

## 🧠 Klíčové principy

* **100% Local-First:** Svá data vlastníte. Vždy. DataMind pracuje nad složkou souborů na vašem disku.
* **Text & Data:** Perfektní synergie mezi volností `.md` souborů a silou `.db` (SQLite) databáze.
* **🔓 Open-Core:** Toto úložiště (`datamind-core`) bude vždy zdarma a open-source pod licencí Apache 2.0. Na něm budujeme naši (oddělenou) prémiovou službu `DataMind Cloud`.
* **🔌 Rozšiřitelnost:** Bohaté API pro pluginy vám umožní připojit vaše poznámky, data a dokonce i IoT zařízení.
* **🎓 AI-Native & Edukace:** Tuto aplikaci stavíme veřejně a používáme k tomu nejmodernější AI nástroje. Je to zároveň i edukační projekt, který ukazuje, jak se takové systémy staví.

## ⚠️ Stav projektu

Projekt je v rané (pre-alpha) fázi. Právě nastavujeme základní architekturu a vývojové prostředí.

## � Struktura projektu

DataMind Core je **Nx monorepo** s následující strukturou:

```
datamind-core/
├── apps/
│   ├── datamind-pwa/      # Progressive Web App (SvelteKit + Vite)
│   └── datamind-mobile/   # Mobilní aplikace (Capacitor)
├── packages/              # Sdílené knihovny
└── .devcontainer/         # GitHub Codespaces konfigurace
```

**📖 Podrobná dokumentace:** [MONOREPO.md](./MONOREPO.md)

## �🚀 Začínáme (Vývoj)

Tento projekt je navržen pro vývoj primárně v **GitHub Codespaces**.

Nemusíte si na svůj počítač nic instalovat. Náš Codespace je předkonfigurován se vším, co potřebujete:
* **Node.js 22 LTS**
* **pnpm 10** - Efektivní package manager
* **Nx** - Monorepo management
* TypeScript & Svelte
* **GitHub CLI (`gh`)**
* **GitHub Copilot CLI (`copilot`)**

1.  Klikněte na tlačítko "Open in GitHub Codespaces" výše.
2.  Počkejte, než se sestaví kontejner (pár minut).
3.  Otevře se vám plně nakonfigurované prostředí VS Code.
4.  Dependencies se nainstalují automaticky!
5.  Můžete začít kódovat!

### Lokální vývoj

Pokud máte nainstalované VS Code s extensionem **Dev Containers**:

```bash
# 1. Naklonujte repozitář
git clone https://github.com/DigiLifeHub/datamind-core.git
cd datamind-core

# 2. Otevřete ve VS Code
code .

# 3. Stiskněte F1 → "Dev Containers: Reopen in Container"
```

Po otevření v kontejneru:

```bash
# Instalace dependencies
pnpm install

# Spustit PWA dev server
pnpm exec nx serve datamind-pwa

# Zkontrolovat dostupné nástroje
gh --version
copilot --help
node --version

# Zobrazit všechny projekty
pnpm exec nx show projects
```

### Dostupné příkazy

```bash
# PWA aplikace
pnpm exec nx serve datamind-pwa    # Dev server (port 5173)
pnpm exec nx build datamind-pwa    # Production build
pnpm exec nx preview datamind-pwa  # Preview buildu (port 4173)
pnpm exec nx check datamind-pwa    # TypeScript type checking

# Build všech projektů
pnpm exec nx run-many -t build --all

# Formátování
pnpm run format
```

## 🛠️ Technologický stack

### Monorepo Management
* **Nx 22** - Build system a monorepo tools
* **pnpm 10** - Rychlý, efektivní package manager

## 🛠️ Technologický stack

### Monorepo Management
* **Nx 22** - Build system a monorepo tools
* **pnpm 10** - Rychlý, efektivní package manager

### Frontend (PWA)
* **SvelteKit 4** + TypeScript
* **Vite 5** - Lightning fast build tool
* **Capacitor 6** - Mobilní wrapper

### Backend (Plánováno)
* **Backend (Community):** NestJS

### DevOps & Tools
* **Vývojové AI:** GitHub Copilot CLI
* **CI/CD:** GitHub Actions
* **Cloud (pro Pro verzi):** Google Cloud Platform (GCP) & Firebase

## 📚 Dokumentace

- **[MONOREPO.md](./MONOREPO.md)** - Kompletní průvodce Nx monorepo
- **[.devcontainer/README.md](./.devcontainer/README.md)** - Codespaces setup
- **[GitHub Issues](https://github.com/digilifehub/datamind-core/issues)** - Úkoly a bugy
- **[GitHub Discussions](https://github.com/digilifehub/datamind-core/discussions)** - Diskuze

## 🙌 Přispívání

Vítáme všechny přispěvatele! Ať už jste zkušený vývojář, nebo student, který se učí kódovat s AI, jste tu správně.

1.  Projděte si naše [GitHub Issues](https://github.com/digilifehub/datamind-core/issues) a najděte si úkol.
2.  Začněte diskuzi v [GitHub Discussions](https://github.com/digilifehub/datamind-core/discussions).
3.  Vytvořte si Pull Request z vašeho Codespace!

## 📜 Licence

Tento projekt je licencován pod **Apache 2.0 License**. Podrobnosti naleznete v souboru [LICENSE](LICENSE).
