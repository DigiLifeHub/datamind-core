# Dev Container Configuration

Tato složka obsahuje konfiguraci pro GitHub Codespaces a VS Code Dev Containers.

## Co je nakonfigurováno

### 🐳 Base Image
- **Node.js 22 LTS** (Bookworm)
- Image: `mcr.microsoft.com/devcontainers/javascript-node:1-22-bookworm`

### 🛠️ Nástroje
Automaticky instalované a dostupné v terminálu:
- **GitHub CLI** (`gh`) - verze 2.82.0+
- **GitHub Copilot CLI** (`copilot`) - npm package @github/copilot
- **Git LFS** - správa velkých souborů

### 📦 VS Code Extensions
Automaticky nainstalované:
- `svelte.svelte-vscode` - Svelte language support
- `esbenp.prettier-vscode` - Code formatter
- `github.copilot` - AI pair programmer
- `github.copilot-chat` - AI chat assistant
- `dbaeumer.vscode-eslint` - JavaScript linter

### ⚙️ Post-Create Setup
Skript `post-create.sh` automaticky:
1. Nainstaluje Git LFS (pokud není přítomen)
2. Ověří dostupnost GitHub CLI
3. Nainstaluje GitHub Copilot CLI jako npm balíček (`@github/copilot`)
4. Spustí `pnpm install` pokud existuje `package.json` nebo workspace

### 🔌 Porty
Automaticky forwardované:
- **5173** - Vite Dev Server
- **4173** - Vite Preview Server

## Použití

### První spuštění
Po vytvoření Codespace proběhne automaticky post-create setup. Můžete sledovat průběh v terminálu.

### Dostupné příkazy

```bash
# GitHub CLI
gh --version
gh auth status
gh repo view

# GitHub Copilot CLI
copilot --help
copilot suggest "jak udělat commit všech změn?"
copilot explain "npm install"

# Node.js & npm
node --version  # v22.x.x
npm --version
npm install
npm run dev

# Package manager
npm install     # nebo
pnpm install    # nebo
yarn install
```

### Autentizace GitHub Copilot

Při prvním použití Copilot CLI bude potřeba autentizace přes web:

```bash
# Přihlášení přes GitHub (pokud ještě nejste)
gh auth login --web

# Copilot CLI použije vaše GitHub credentials automaticky
copilot suggest "test"
```

## Struktura souborů

```
.devcontainer/
├── devcontainer.json    # Hlavní konfigurace
└── post-create.sh       # Setup script po vytvoření
```

## Testování lokálně

Pokud máte VS Code s Dev Containers extension:

1. Otevřete projekt ve VS Code
2. Stiskněte `F1` → "Dev Containers: Reopen in Container"
3. Počkejte na build a setup

## Troubleshooting

### Copilot CLI nefunguje
```bash
# Reinstalace
npm uninstall -g @github/copilot
npm install -g @github/copilot

# Kontrola autentizace
gh auth status
gh auth login --web
```

### Git LFS chybí
```bash
# Manuální instalace
sudo apt-get update && sudo apt-get install -y git-lfs
git lfs install
```

### npm install selhává
```bash
# Vyčištění cache (pro npm)
npm cache clean --force
rm -rf node_modules package-lock.json
npm install

# Pro pnpm workspace
pnpm store prune
rm -rf node_modules pnpm-lock.yaml
pnpm install
```

## Další informace

- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [GitHub Codespaces](https://docs.github.com/en/codespaces)
- [GitHub CLI](https://cli.github.com/)
- [GitHub Copilot CLI](https://github.com/github/copilot-cli)
- [Git LFS](https://git-lfs.github.com/)
