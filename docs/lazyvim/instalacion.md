# LazyVim - Instalación y Configuración

## ¿Qué es LazyVim?

LazyVim es una configuración preconfigurada de Neovim que incluye:
- 🚀 Configuración moderna y rápida
- 📦 Gestión de plugins con lazy.nvim
- 🎨 Tema Catppuccin por defecto
- 🔌 Muchos plugins útiles preinstalados
- ⌨️ Keymaps sensatos y bien documentados

## Requisitos

### Instalados con Homebrew

Estas herramientas se instalan en el sistema, **NO van en dotfiles**:

| Herramienta | Instalación | Ubicación | Propósito |
|-------------|-------------|-----------|-----------|
| **Neovim** | `brew install neovim` | `/opt/homebrew/bin/nvim` | Editor base (v0.11.5+) |
| **lazygit** | `brew install lazygit` | `/opt/homebrew/bin/lazygit` | Git UI dentro de Neovim |
| **ripgrep** | `brew install ripgrep` | `/opt/homebrew/bin/rg` | Búsqueda rápida de texto |
| **fd** | `brew install fd` | `/opt/homebrew/bin/fd` | Búsqueda rápida de archivos |
| **tree-sitter** | `brew install tree-sitter` | `/opt/homebrew/bin/tree-sitter` | Syntax highlighting avanzado |

### Ya teníamos instalado

- ✅ **Git >= 2.19.0**
- ✅ **JetBrains Mono Nerd Font** (para iconos)
- ✅ **WezTerm** (terminal con true color)

## Instalación de LazyVim

### 1. Clonar el starter

```bash
# Si NO tienes configuración previa de Neovim
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Si YA tienes configuración (hacer backup primero)
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

### 2. Remover el .git del starter (opcional pero recomendado)

```bash
rm -rf ~/.config/nvim/.git
```

Esto te permite gestionar la configuración como parte de tus propios dotfiles.

### 3. Iniciar Neovim

```bash
nvim
```

LazyVim automáticamente:
- ✅ Instala todos los plugins
- ✅ Configura LSP servers
- ✅ Descarga tree-sitter parsers
- ✅ Configura todo para ti

## Estructura de LazyVim

```
~/.config/nvim/
├── lua/
│   ├── config/           # Configuración general
│   │   ├── autocmds.lua  # Auto-comandos
│   │   ├── keymaps.lua   # Atajos de teclado personalizados
│   │   ├── lazy.lua      # Configuración de lazy.nvim
│   │   └── options.lua   # Opciones de Neovim
│   └── plugins/          # Tus plugins personalizados
│       └── example.lua   # Ejemplo (puedes borrarlo)
├── init.lua              # Punto de entrada
└── lazy-lock.json        # Lock file de versiones de plugins
```

## ¿Qué va en los dotfiles?

**TODO** el contenido de `~/.config/nvim/` debe ir en dotfiles:

```
dotfiles-anywhere/
└── common/
    └── nvim/            # ← Toda tu configuración de Neovim
        ├── lua/
        │   ├── config/
        │   └── plugins/
        ├── init.lua
        └── lazy-lock.json
```

### ¿Por qué TODO va en dotfiles?

- ✅ **Archivos de configuración** → Sí, van en dotfiles
- ✅ **Plugins descargados** → NO, pero `lazy-lock.json` replica las versiones
- ✅ **Tu configuración personalizada** → Sí, en `lua/config/` y `lua/plugins/`

**Lazy.nvim** reinstala automáticamente todos los plugins cuando:
1. Clonas el repo en una Mac nueva
2. Ejecutas `nvim` por primera vez
3. Lee `lazy-lock.json` para instalar las versiones exactas

## Personalización

### Agregar un nuevo plugin

Crea un archivo en `~/.config/nvim/lua/plugins/`:

```lua
-- ~/.config/nvim/lua/plugins/my-plugin.lua
return {
  "nombre-autor/nombre-plugin",
  config = function()
    -- Tu configuración aquí
  end,
}
```

### Cambiar opciones

Edita `~/.config/nvim/lua/config/options.lua`:

```lua
-- Ejemplo: Cambiar tab size
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
```

### Agregar keymaps

Edita `~/.config/nvim/lua/config/keymaps.lua`:

```lua
-- Ejemplo: Nuevo atajo
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
```

## Comandos útiles dentro de Neovim

### Gestión de plugins

| Comando | Descripción |
|---------|-------------|
| `:Lazy` | Abrir UI de lazy.nvim |
| `:Lazy sync` | Sincronizar plugins (update + install + clean) |
| `:Lazy update` | Actualizar plugins |
| `:Lazy clean` | Limpiar plugins no usados |
| `:Lazy profile` | Ver tiempo de carga de plugins |

### LazyVim específico

| Comando | Descripción |
|---------|-------------|
| `:LazyExtras` | Ver/instalar extras opcionales |
| `:LazyHealth` | Verificar salud de la instalación |
| `:checkhealth` | Verificar todas las dependencias |

### LSP y herramientas

| Comando | Descripción |
|---------|-------------|
| `:Mason` | Abrir gestor de LSP/DAP/Linters/Formatters |
| `:LspInfo` | Ver LSPs activos |
| `:Telescope` | Abrir fuzzy finder |

## Keymaps principales

### General

| Atajo | Acción |
|-------|--------|
| `<leader>` | Espacio (por defecto) |
| `<leader>ff` | Find files (buscar archivos) |
| `<leader>fg` | Find text (buscar en archivos) |
| `<leader>e` | Toggle file explorer |
| `<leader>gg` | Abrir lazygit |

### Navegación

| Atajo | Acción |
|-------|--------|
| `<C-h/j/k/l>` | Navegar entre ventanas |
| `<S-h/l>` | Cambiar de buffer (anterior/siguiente) |
| `gd` | Go to definition |
| `gr` | Go to references |

### Edición

| Atajo | Acción |
|-------|--------|
| `<leader>ca` | Code actions |
| `<leader>cf` | Format document |
| `<leader>cr` | Rename symbol |
| `gcc` | Toggle comment line |
| `gc` | Toggle comment (visual mode) |

Ver todos los keymaps: Presiona `<leader>` y espera, aparecerá which-key.

## Ubicaciones importantes

### Configuración

- **LazyVim config**: `~/.config/nvim/`
- **Plugins instalados**: `~/.local/share/nvim/lazy/`
- **Data**: `~/.local/share/nvim/`
- **State**: `~/.local/state/nvim/`
- **Cache**: `~/.cache/nvim/`

### Lo que va en dotfiles

```
common/nvim/               # Solo esto
├── lua/
│   ├── config/
│   └── plugins/
├── init.lua
└── lazy-lock.json
```

### Lo que NO va en dotfiles

- ❌ `~/.local/share/nvim/` (plugins descargados, muy pesado)
- ❌ `~/.local/state/nvim/` (estado temporal)
- ❌ `~/.cache/nvim/` (cache temporal)

## Workflow en una Mac nueva

1. **Instalar herramientas** (Homebrew):
   ```bash
   brew install neovim lazygit ripgrep fd tree-sitter
   ```

2. **Copiar configuración** desde dotfiles:
   ```bash
   cp -r ~/dotfiles-anywhere/common/nvim ~/.config/
   ```

3. **Abrir Neovim**:
   ```bash
   nvim
   ```
   
4. **Lazy.nvim automáticamente**:
   - Lee `lazy-lock.json`
   - Descarga todos los plugins
   - Instala LSP servers con Mason
   - Todo queda igual que en tu Mac original

## Troubleshooting

### Plugins no se instalan

```vim
:Lazy sync
```

### LSP no funciona

```vim
:Mason
```
Instala el LSP server que necesites (Python, TypeScript, etc.)

### Tree-sitter no compila

```vim
:TSUpdate
:TSInstall <language>
```

### Verificar salud general

```vim
:checkhealth
```

## Extras opcionales de LazyVim

LazyVim viene con "extras" que puedes habilitar:

```vim
:LazyExtras
```

Ejemplos:
- **Languages**: python, typescript, go, rust, etc.
- **UI**: dashboard, noice (notificaciones), etc.
- **Coding**: copilot, codeium, etc.
- **Editor**: mini.files, harpoon, etc.

Estos extras se guardan en `lua/config/lazy.lua` y también van en dotfiles.

---

**Documentado**: 2025-12-02
