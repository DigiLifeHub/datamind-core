# Dev Container Configuration

Tato složka obsahuje konfiguraci pro GitHub Codespaces a VS Code Dev Containers.

## Co je nakonfigurováno

### 🐳 Base Image
- **Node.js 22 LTS** (Bookworm)
- Image: `mcr.microsoft.com/devcontainers/javascript-node:1-22-bookworm`

### 🛠️ Nástroje
Automaticky instalované a dostupné v terminálu:
- **GitHub CLI** (`gh`) - verze 2.75.0+
- **GitHub Copilot CLI** (`gh copilot` nebo alias `copilot`)

### 📦 VS Code Extensions
Automaticky nainstalované:
- `svelte.svelte-vscode` - Svelte language support
- `esbenp.prettier-vscode` - Code formatter
- `github.copilot` - AI pair programmer
- `github.copilot-chat` - AI chat assistant
- `dbaeumer.vscode-eslint` - JavaScript linter

### ⚙️ Post-Create Setup
Skript `post-create.sh` automaticky:
1. Ověří dostupnost GitHub CLI
2. Nainstaluje GitHub Copilot CLI extension
3. Vytvoří alias `copilot` pro snadnější použití
4. Spustí `npm install` pokud existuje `package.json`

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
gh copilot --help
copilot --help  # alias

# Copilot suggestions
gh copilot suggest "jak udělat commit všech změn?"
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

Při prvním použití Copilot CLI může být potřeba autentizace:

```bash
gh auth login
# nebo
gh auth refresh -s copilot
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
# Reinstalace extension
gh extension remove gh-copilot
gh extension install github/gh-copilot

# Kontrola autentizace
gh auth status
```

### npm install selhává
```bash
# Vyčištění cache
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

## Další informace

- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [GitHub Codespaces](https://docs.github.com/en/codespaces)
- [GitHub CLI](https://cli.github.com/)
- [GitHub Copilot CLI](https://githubnext.com/projects/copilot-cli)
