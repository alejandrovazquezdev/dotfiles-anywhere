# Contexto del Proyecto: dotfiles-anywhere

## ⚠️ RECORDATORIO IMPORTANTE PARA COPILOT

**ULTRATHINK**: Cada vez que hagas cambios o agregues configuraciones:

1. **Documentar en README.md** si es información general para usuarios
2. **Documentar en docs/aprendizaje.md** si son conceptos, ubicaciones o FAQ
3. **Documentar en docs/contexto-copilot.md** (este archivo) si es contexto interno del proyecto
4. **Mantener las 3 fuentes sincronizadas** - No dejar información solo en una

**Siempre pregúntate**: ¿Esta información debería estar documentada? ¿Dónde?

---

## Resumen
Este es un repositorio de dotfiles multiplataforma (macOS, Linux, Windows) que gestiona configuraciones personales de herramientas de desarrollo. El proyecto está en fase inicial de construcción.

## Filosofía del Proyecto
- **Copias, no symlinks**: Los scripts copian archivos en lugar de crear enlaces simbólicos
- **DRY RUN por defecto**: Todos los scripts muestran qué harían antes de aplicar cambios
- **Git para control de versiones**: No necesitamos symlinks porque usamos git para rastrear cambios
- **Estructura híbrida**: Archivos comunes (2+ SO) y específicos por sistema

## Estructura del Repositorio

```
dotfiles-anywhere/
├── common/                    # Configuraciones para 2 o más SO
│   ├── .gitconfig            # Git config para macOS/Linux (autocrlf = input)
│   ├── starship.toml         # Starship prompt (preset: Catppuccin Powerline)
│   └── wezterm/
│       └── wezterm.lua       # Terminal config con JetBrains Mono Nerd Font
├── macos/
│   ├── .zshrc                # Shell con Oh My Zsh + Starship
│   └── scripts/
│       └── install.sh        # Script de instalación para macOS ✅ COMPLETO
├── linux/
│   └── scripts/              # ❌ Pendiente
├── windows/
│   ├── .gitconfig            # Git config específico (autocrlf = true)
│   ├── PowerShell/
│   │   └── Microsoft.PowerShell_profile.ps1  # Vacío
│   └── scripts/              # ❌ Pendiente
├── docs/
│   └── aprendizaje.md        # Documentación de conceptos y ubicaciones
├── README.md                 # Documentación principal
└── gitignore                 # Para el repo mismo
```

## Configuraciones Actuales

### WezTerm (`common/wezterm/wezterm.lua`)
- **Tema**: Catppuccin Mocha
- **Fuente**: JetBrains Mono Nerd Font, Medium, 13pt
- **Transparencia**: 0.92 con blur 30
- **Ventana**: 130x35, padding 16px
- **Cursor**: BlinkingBar
- **Decoraciones**: TITLE | RESIZE (mantiene botones)

### Starship (`common/starship.toml`)
- **Preset**: Catppuccin Powerline
- **Ubicación**: `~/.config/starship.toml`

### Git (`common/.gitconfig` y `windows/.gitconfig`)
- **Usuario**: Alejandro Isaac Vazquez Lopez
- **Email**: alejandroisaacvazquezlopez@gmail.com
- **Editor**: VSCode (`code --wait`)
- **Branch default**: main
- **SSH**: Usa `git@github.com:` en lugar de HTTPS
- **autocrlf**: `input` (macOS/Linux), `true` (Windows)

### Zsh (`macos/.zshrc`)
- **Framework**: Oh My Zsh
- **Plugins**: git
- **Prompt**: Starship (inicializado al final)
- **Mise**: Activado con `eval "$(mise activate zsh)"`
- **PATH personalizado**: Antigravity, Ruby de Homebrew

### Mise (gestor de versiones)
- **NO tiene dotfiles** en el repo
- **Configuración global**: `~/.config/mise/config.toml` (NO incluida en repo)
- **Versiones instaladas**: Python 3.14.0 (global)
- **Ubicación de lenguajes**: `~/.local/share/mise/installs/`
- **Activación**: En `.zshrc` con `eval "$(mise activate zsh)"`

## Script de Instalación macOS

**Ubicación**: `macos/scripts/install.sh`

**Características**:
- Modo DRY RUN por defecto (`DRY_RUN=1`)
- Output con colores (verde, amarillo, azul)
- Crea directorios automáticamente si no existen
- NO hace backups (se usa git para revertir)

**Archivos que instala**:
1. `common/wezterm/wezterm.lua` → `~/.config/wezterm/wezterm.lua`
2. `common/starship.toml` → `~/.config/starship.toml`
3. `common/.gitconfig` → `~/.gitconfig`
4. `macos/.zshrc` → `~/.zshrc`

**Uso**:
```bash
cd macos/scripts
./install.sh              # DRY RUN (solo muestra)
DRY_RUN=0 ./install.sh   # Aplicar cambios
```

## Herramientas Instaladas en el Sistema

### macOS (ubicaciones reales)
- **WezTerm**: `/Applications/WezTerm.app` (programa)
- **Starship**: `/opt/homebrew/bin/starship` (instalado con Homebrew)
- **JetBrains Mono Nerd Font**: `~/Library/Fonts/JetBrainsMono*.ttf`
- **Git**: `/opt/homebrew/bin/git`
- **Zsh**: `/bin/zsh` (preinstalado)
- **Oh My Zsh**: `~/.oh-my-zsh/`
- **Mise**: `/opt/homebrew/bin/mise` (gestor de versiones)
- **Python 3.14.0**: `~/.local/share/mise/installs/python/3.14.0/` (vía Mise)

## Workflow de Desarrollo

1. **Editar** archivos en el repositorio (`~/dotfiles-anywhere/`)
2. **Probar** en DRY RUN: `cd macos/scripts && ./install.sh`
3. **Aplicar** cambios: `DRY_RUN=0 ./install.sh`
4. **Commitear**: `git add . && git commit -m "mensaje"`
5. **Push**: `git push`

## Información del Repositorio

- **Nombre**: dotfiles-anywhere
- **Owner**: alejandrovazquezdev
- **Branch**: main
- **Clone**: `git clone git@github.com:alejandrovazquezdev/dotfiles-anywhere.git ~/dotfiles-anywhere`

## Notas Importantes

### Diferencias entre sistemas
- **autocrlf**: `input` en macOS/Linux, `true` en Windows
- **Rutas**: `~/.config/` en POSIX, `%USERPROFILE%\.config\` en Windows
- **Fuentes**: `~/Library/Fonts/` en macOS, `~/.local/share/fonts/` en Linux, `%USERPROFILE%\AppData\Local\Microsoft\Windows\Fonts\` en Windows

### Pendientes
- [ ] Crear script de instalación para Linux (`linux/scripts/install.sh`)
- [ ] Crear script de instalación para Windows (`windows/scripts/install.ps1`)
- [ ] Agregar configuración de Neovim
- [ ] Documentar proceso de instalación de Oh My Zsh
- [ ] Considerar agregar lista de paquetes (Brewfile, etc.)
- [ ] Instalar otros lenguajes con Mise (Node, Ruby, Go, etc.)

## Decisiones de Diseño

### Mise: Sin config.toml en dotfiles
- **Decisión**: NO incluir `~/.config/mise/config.toml` en el repositorio
- **Razón**: Cada máquina puede necesitar versiones diferentes de lenguajes
- **Alternativa**: Cada máquina crea su propio `config.toml` al instalar lenguajes con `mise use --global`
- **Nota**: El archivo se crea automáticamente al usar `--global`, pero no se versiona

### Estrategia de instalación de lenguajes
- **Método elegido**: Mise para todos los lenguajes de programación
- **NO usar**: Instaladores oficiales (python.org, nodejs.org) ni Homebrew para lenguajes
- **Ventaja**: Sin conflictos de PATH, múltiples versiones coexistiendo, cambio automático por proyecto

## Comandos Útiles

### Verificar fuentes instaladas
```bash
ls ~/Library/Fonts/ | grep -i "nerd\|mono"
```

### Instalar fuente
```bash
brew install font-jetbrains-mono-nerd-font
```

### Copiar configuración al repo
```bash
cp ~/.config/wezterm/wezterm.lua ~/dotfiles-anywhere/common/wezterm/wezterm.lua
cp ~/.zshrc ~/dotfiles-anywhere/macos/.zshrc
```

### Probar script
```bash
cd ~/dotfiles-anywhere/macos/scripts && ./install.sh
```

### Mise - Gestión de lenguajes
```bash
# Ver versiones instaladas
mise list

# Ver configuración global actual
cat ~/.config/mise/config.toml

# Instalar nueva versión global
mise use --global node@22

# Ver dónde está instalado un lenguaje
mise where python

# Instalar todas las herramientas definidas
mise install
```

## Estado Actual del Proyecto

✅ **Completado**:
- Estructura básica del repositorio
- Configuración de WezTerm con fuente Nerd Font
- Configuración de Starship
- Configuración de Git (común y Windows)
- Script de instalación para macOS
- Documentación en README y docs/aprendizaje.md
- .zshrc con Oh My Zsh y Starship
- Mise instalado y activado en zsh
- Python 3.14.0 instalado con Mise
- Documentación de herramientas (docs/herramientas.md)
- Documentación de ubicaciones de instalación de lenguajes

❌ **Pendiente**:
- Scripts de instalación para Linux y Windows
- Configuración de Neovim
- Documentación de dependencias necesarias
- Instalación de otros lenguajes (Node, Ruby, Go)

---

**Última actualización**: 2025-11-30
**Mantenedor**: alejandrovazquezdev
