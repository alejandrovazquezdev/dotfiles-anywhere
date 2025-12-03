# Herramientas del Sistema

Este documento lista las herramientas y programas que uso en mi entorno de desarrollo, separando entre:
- **Herramientas con dotfiles** - Configuraciones incluidas en este repo
- **Herramientas sin dotfiles** - Programas que solo requieren instalación

---

## 🔧 Herramientas CON Dotfiles (incluidas en este repo)

Estas herramientas tienen archivos de configuración que se gestionan en este repositorio.

### Terminal y Shell

| Herramienta | Dotfile(s) | Ubicación en repo | Descripción |
|-------------|-----------|------------------|-------------|
| **WezTerm** | `wezterm.lua` | `common/wezterm/` | Emulador de terminal multiplataforma |
| **Starship** | `starship.toml` | `common/starship.toml` | Prompt personalizable para cualquier shell |
| **Zsh** | `.zshrc` | `macos/.zshrc` | Shell principal en macOS |
| **Bash** | `.bashrc` | `linux/.bashrc` (pendiente) | Shell principal en Linux |

### Desarrollo

| Herramienta | Dotfile(s) | Ubicación en repo | Descripción |
|-------------|-----------|------------------|-------------|
| **Git** | `.gitconfig` | `common/.gitconfig`, `windows/.gitconfig` | Control de versiones |
| **Neovim** | `init.lua`, etc. | `common/nvim/` (pendiente) | Editor de texto modal |

---

## ⚙️ Herramientas SIN Dotfiles (solo instalación)

Estas herramientas NO tienen configuración en el repo, solo se instalan en el sistema.

### Gestores de Versiones y Paquetes

| Herramienta | Instalación | Propósito | Notas |
|-------------|-------------|-----------|-------|
| **Mise** | `brew install mise` | Gestor de versiones de lenguajes (Python, Node, Ruby, etc.) | Se activa en `.zshrc` con `eval "$(mise activate zsh)"` |
| **Homebrew** | Script oficial | Gestor de paquetes para macOS/Linux | [brew.sh](https://brew.sh) |
| **Oh My Zsh** | Script oficial | Framework para gestionar configuración de Zsh | [ohmyz.sh](https://ohmyz.sh) |

### Lenguajes de Programación

**Nota**: Los lenguajes se instalan con **Mise**, no tienen dotfiles propios en este repo.

| Lenguaje | Instalación con Mise | Versión Global Actual |
|----------|---------------------|----------------------|
| **Python** | `mise use --global python@3.14` | 3.14.0 |
| **Node.js** | `mise use --global node@22` | (por instalar) |
| **Ruby** | `mise use --global ruby@3.3` | (por instalar) |
| **Go** | `mise use --global go@1.21` | (por instalar) |

**Ubicación de instalaciones**: `~/.local/share/mise/installs/<lenguaje>/<versión>/`

### Fuentes

| Fuente | Instalación | Notas |
|--------|-------------|-------|
| **JetBrains Mono Nerd Font** | `brew install font-jetbrains-mono-nerd-font` | Fuente principal, incluye iconos necesarios para Starship |

### Editores y IDEs

| Herramienta | Instalación | Configuración |
|-------------|-------------|---------------|
| **Visual Studio Code** | Descarga oficial o `brew install --cask visual-studio-code` | Sincronización con GitHub (no en este repo) |
| **Neovim** | `brew install neovim` | Config en `common/nvim/` (pendiente) |

---

## 📋 Checklist de Instalación (Mac nuevo)

Orden recomendado para configurar un Mac desde cero:

### 1. Sistema Base
```bash
# Instalar Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clonar dotfiles
git clone git@github.com:alejandrovazquezdev/dotfiles-anywhere.git ~/dotfiles-anywhere
```

### 2. Terminal y Shell
```bash
# Instalar herramientas
brew install wezterm starship mise git

# Instalar Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar fuente
brew install font-jetbrains-mono-nerd-font
```

### 3. Aplicar Dotfiles
```bash
cd ~/dotfiles-anywhere/macos/scripts
./install.sh              # Ver cambios
DRY_RUN=0 ./install.sh   # Aplicar
```

### 4. Configurar WezTerm
- Abrir WezTerm
- Configurar fuente en preferencias si es necesario
- Reiniciar terminal

### 5. Lenguajes con Mise
```bash
# Activar mise (ya debería estar en .zshrc)
source ~/.zshrc

# Instalar lenguajes globales
mise use --global python@3.14
mise use --global node@22
# etc...
```

### 6. Verificar
```bash
mise doctor           # Verificar mise
starship --version    # Verificar starship
python --version      # Verificar Python
git config --list     # Verificar git
```

---

## 🔄 Mantener Actualizado

### Actualizar Homebrew y paquetes
```bash
brew update && brew upgrade
```

### Actualizar Mise
```bash
brew upgrade mise
```

### Actualizar lenguajes gestionados por Mise
```bash
mise outdated         # Ver versiones disponibles
mise use --global python@3.15  # Actualizar a nueva versión
```

### Actualizar Oh My Zsh
```bash
omz update
```

---

## 📝 Notas Importantes

### Sobre Mise
- **NO crear** `~/.config/mise/config.toml` global - usar solo por proyecto
- Las versiones globales se usan como "por defecto" hasta que un proyecto especifique otra
- Ubicación de instalaciones: `~/.local/share/mise/installs/`

### Sobre Dotfiles
- Los dotfiles se **copian**, no se crean symlinks
- Editar archivos en el repo y ejecutar `install.sh` para aplicar
- Usar git para revertir cambios, no hay backups automáticos

### Prioridad de Configuraciones
Si existe el mismo archivo en `common/` y en carpeta de SO (ej: `macos/`):
- El script usa el **específico del SO**
- Ejemplo: `windows/.gitconfig` sobrescribe `common/.gitconfig` en Windows

---

**Última actualización**: 2025-12-02
