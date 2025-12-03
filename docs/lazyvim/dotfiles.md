# Decisiones de Configuración - LazyVim

Este documento explica las decisiones tomadas sobre qué incluir o no en los dotfiles relacionado con Neovim/LazyVim.

## ¿Qué va en dotfiles?

### ✅ SÍ incluir en dotfiles

**Toda la carpeta `~/.config/nvim/`**:
```
common/nvim/
├── lua/
│   ├── config/
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins/
│       └── *.lua (tus plugins personalizados)
├── init.lua
└── lazy-lock.json  ← IMPORTANTE: Lock file de versiones
```

**Razones**:
- Son archivos de configuración (texto plano, Lua)
- Pequeños (KB, no GB)
- Reproducibles: `lazy-lock.json` garantiza mismas versiones de plugins
- Tu personalización: keymaps, opciones, plugins custom

### ❌ NO incluir en dotfiles

**Plugins descargados y caches**:
```
~/.local/share/nvim/       ❌ Plugins instalados (cientos de MB)
~/.local/state/nvim/       ❌ Estado temporal
~/.cache/nvim/             ❌ Cache temporal
```

**Razones**:
- Muy pesados (100-500 MB)
- Se reinstalan automáticamente
- Lazy.nvim lee `lazy-lock.json` y descarga todo
- Generados, no configuración

## Herramientas del sistema

### ❌ NO van en dotfiles (se instalan con Homebrew)

```bash
brew install neovim        # El editor
brew install lazygit       # Git UI
brew install ripgrep       # Búsqueda
brew install fd            # Find files
brew install tree-sitter   # Syntax
```

**Razón**: Son binarios compilados, no configuración.

**Cómo replicar**: Documentar en `docs/herramientas.md` las instalaciones necesarias.

## Flujo de trabajo

### Mac actual (donde configuras)

```bash
# 1. Modificas tu config
nvim ~/.config/nvim/lua/plugins/my-plugin.lua

# 2. Copias al repo
cp -r ~/.config/nvim ~/dotfiles-anywhere/common/

# 3. Commit y push
git add common/nvim/
git commit -m "Update Neovim config"
git push
```

### Mac nueva (instalación desde cero)

```bash
# 1. Instalar herramientas
brew install neovim lazygit ripgrep fd tree-sitter

# 2. Clonar dotfiles
git clone git@github.com:alejandrovazquezdev/dotfiles-anywhere.git

# 3. Ejecutar script de instalación
cd dotfiles-anywhere/macos/scripts
DRY_RUN=0 ./install.sh
# (Esto copia common/nvim/ → ~/.config/nvim/)

# 4. Abrir Neovim
nvim
# Lazy.nvim lee lazy-lock.json y descarga todo automáticamente
```

## Lazy-lock.json: El archivo mágico

**`lazy-lock.json`** es CRUCIAL:

```json
{
  "LazyVim": { "branch": "main", "commit": "abc123..." },
  "nvim-cmp": { "branch": "main", "commit": "def456..." },
  "telescope.nvim": { "branch": "master", "commit": "789ghi..." }
}
```

**Qué hace**:
- Fija las versiones exactas de cada plugin
- Garantiza reproducibilidad: mismos plugins, mismas versiones
- Lazy.nvim lo lee automáticamente al iniciar

**Por qué es importante**:
- ✅ Sin él: Lazy instala últimas versiones (puede romper cosas)
- ✅ Con él: Instala versiones probadas que sabes que funcionan

## Personalización recomendada

### Estructura sugerida

```
~/.config/nvim/
├── lua/
│   ├── config/
│   │   ├── keymaps.lua      ← Tus atajos de teclado
│   │   ├── options.lua      ← Tus opciones (tab size, etc.)
│   │   └── autocmds.lua     ← Auto-comandos personalizados
│   └── plugins/
│       ├── colorscheme.lua  ← Tema personalizado
│       ├── lsp.lua          ← Config de LSP si necesitas
│       ├── my-plugin.lua    ← Plugins adicionales que agregues
│       └── overrides.lua    ← Sobrescribir defaults de LazyVim
└── lazy-lock.json           ← Generado automáticamente
```

### Ejemplo: Agregar tu propio plugin

Crea `~/.config/nvim/lua/plugins/obsidian.lua`:

```lua
return {
  "epwalsh/obsidian.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      { name = "personal", path = "~/notes" },
    },
  },
}
```

Cuando copies a dotfiles, este archivo se incluye y funciona en todas tus Macs.

## Actualización de plugins

### En tu Mac principal

```vim
:Lazy update    " Actualiza plugins
:Lazy sync      " Sync (update + clean)
```

Esto actualiza `lazy-lock.json` automáticamente.

### Propagar a otras Macs

```bash
# Mac 1 (donde actualizaste)
cd ~/dotfiles-anywhere
cp ~/.config/nvim/lazy-lock.json common/nvim/
git add common/nvim/lazy-lock.json
git commit -m "Update plugin versions"
git push

# Mac 2 (actualizar)
cd ~/dotfiles-anywhere
git pull
cp common/nvim/lazy-lock.json ~/.config/nvim/
nvim  # Lazy.nvim actualiza a las versiones del lock file
```

## Scripts de instalación

El script `macos/scripts/install.sh` debería copiar:

```bash
# En el script, agregar:
if [ -d "$DOTFILES_DIR/common/nvim" ]; then
    if [ "$DRY_RUN" -eq 1 ]; then
        echo "Copiaría: common/nvim/ -> ~/.config/nvim/"
    else
        cp -r "$DOTFILES_DIR/common/nvim" "$HOME/.config/"
        echo "Copiado: ~/.config/nvim/"
    fi
fi
```

## Resumen

| Elemento | En dotfiles | Razón |
|----------|-------------|-------|
| `~/.config/nvim/` | ✅ Sí | Configuración (tu personalización) |
| `lazy-lock.json` | ✅ Sí | Garantiza versiones exactas |
| `~/.local/share/nvim/` | ❌ No | Plugins descargados (pesado, se regenera) |
| Neovim, lazygit, etc. | ❌ No | Binarios del sistema (Homebrew) |
| LSP servers (Mason) | ❌ No | Se reinstalan con `:Mason` |

---

**Última actualización**: 2025-12-02
