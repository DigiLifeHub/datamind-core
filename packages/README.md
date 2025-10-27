# Shared Packages

Tato složka obsahuje sdílené knihovny a utility používané napříč aplikacemi v monorepu.

## 📦 Plánované balíčky

### @datamind/types
Sdílené TypeScript definice a typy

### @datamind/utils
Pomocné funkce a utility

### @datamind/ui-components
Znovupoužitelné UI komponenty (Svelte)

### @datamind/db
SQLite databázové schéma a migrace

### @datamind/markdown
Markdown parser a renderer

## 🔨 Vytvoření nového balíčku

```bash
# 1. Vytvořte složku
mkdir -p packages/muj-balik

# 2. Inicializujte package.json
cd packages/muj-balik
pnpm init

# 3. Vytvořte Nx project.json
cat > project.json << 'EOF'
{
  "name": "@datamind/muj-balik",
  "$schema": "../../node_modules/nx/schemas/project-schema.json",
  "sourceRoot": "packages/muj-balik/src",
  "projectType": "library",
  "tags": ["type:library"],
  "targets": {
    "build": {
      "executor": "@nx/js:tsc",
      "options": {
        "outputPath": "dist/packages/muj-balik",
        "main": "packages/muj-balik/src/index.ts",
        "tsConfig": "packages/muj-balik/tsconfig.json"
      }
    }
  }
}
EOF

# 4. Vytvořte tsconfig.json
cat > tsconfig.json << 'EOF'
{
  "extends": "../../tsconfig.json",
  "compilerOptions": {
    "outDir": "../../dist/packages/muj-balik",
    "declaration": true
  },
  "include": ["src/**/*"]
}
EOF

# 5. Vytvořte src/index.ts
mkdir src
echo "export const hello = () => 'Hello from @datamind/muj-balik';" > src/index.ts
```

## 📖 Použití balíčku v aplikaci

```bash
# Přidejte do package.json aplikace
{
  "dependencies": {
    "@datamind/muj-balik": "workspace:*"
  }
}

# V kódu
import { hello } from '@datamind/muj-balik';
```

## 🧪 Testování

Každý balíček by měl mít vlastní testy:

```bash
pnpm exec nx test @datamind/muj-balik
```

## 📝 Best Practices

1. **Vždy používejte TypeScript** - Pro type safety
2. **Exportujte pouze veřejné API** - Skryjte interní implementace
3. **Dokumentujte API** - JSDoc komentáře pro každou exportovanou funkci
4. **Píšte testy** - Unit testy pro každou knihovnu
5. **Sémantické verzování** - Používejte SemVer pro changelogy

## 🔗 Závislosti mezi balíčky

Nx automaticky detekuje závislosti:

```bash
# Zobrazit graf závislostí
pnpm exec nx graph
```

Balíčky mohou na sobě záviset:

```json
{
  "dependencies": {
    "@datamind/types": "workspace:*",
    "@datamind/utils": "workspace:*"
  }
}
```

---

**Status:** 🚧 Připraveno pro implementaci  
**Last Updated:** October 27, 2025
