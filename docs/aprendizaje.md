# Aprendizaje y Notas

Este documento contiene aclaraciones, conceptos aprendidos y notas útiles sobre el manejo de dotfiles.

## Conceptos Básicos

### ¿Qué son los dotfiles?
Los dotfiles son archivos de configuración en sistemas Unix/Linux/macOS que comienzan con un punto (`.`). Ejemplos: `.zshrc`, `.gitconfig`, `.vimrc`. Estos archivos están ocultos por defecto y contienen configuraciones personalizadas de programas y del sistema.

### Diferencia entre instalación de programas y dotfiles
- **Instalación de programas**: Los binarios/ejecutables del programa (la aplicación en sí)
- **Dotfiles**: Solo los archivos de configuración (cómo se ve y comporta el programa)

**Ejemplo con WezTerm:**
- **Instalación**: `/Applications/WezTerm.app` (macOS) - El programa en sí
- **Dotfile**: `~/.config/wezterm/wezterm.lua` - Tu configuración personal (colores, fuentes, etc.)

## Ubicaciones de Instalación de Programas

### macOS
| Programa | Instalación (binarios) | Configuración (dotfiles) |
|----------|----------------------|-------------------------|
| **WezTerm** | `/Applications/WezTerm.app` | `~/.config/wezterm/wezterm.lua` |
| **Starship** | `/opt/homebrew/bin/starship` | `~/.config/starship.toml` |
| **Git** | `/opt/homebrew/bin/git` o `/usr/bin/git` | `~/.gitconfig` |
| **Neovim** | `/opt/homebrew/bin/nvim` | `~/.config/nvim/` |
| **Zsh** | `/bin/zsh` (preinstalado) | `~/.zshrc` |
| **Oh My Zsh** | `~/.oh-my-zsh/` | `~/.zshrc` |

### Linux (Debian/Ubuntu)
| Programa | Instalación (binarios) | Configuración (dotfiles) |
|----------|----------------------|-------------------------|
| **WezTerm** | `/usr/bin/wezterm` | `~/.config/wezterm/wezterm.lua` |
| **Starship** | `/usr/local/bin/starship` | `~/.config/starship.toml` |
| **Git** | `/usr/bin/git` | `~/.gitconfig` |
| **Neovim** | `/usr/bin/nvim` | `~/.config/nvim/` |
| **Bash** | `/bin/bash` (preinstalado) | `~/.bashrc` |

### Windows
| Programa | Instalación (binarios) | Configuración (dotfiles) |
|----------|----------------------|-------------------------|
| **WezTerm** | `C:\Program Files\WezTerm\` | `%USERPROFILE%\.config\wezterm\wezterm.lua` |
| **Starship** | `C:\Program Files\starship\bin\` | `%USERPROFILE%\.config\starship.toml` |
| **Git** | `C:\Program Files\Git\` | `%USERPROFILE%\.gitconfig` |
| **Neovim** | `C:\Program Files\Neovim\` | `%LOCALAPPDATA%\nvim\` |
| **PowerShell** | `C:\Windows\System32\WindowsPowerShell\` (preinstalado) | `$PROFILE` (ej: `%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`) |

## Ubicaciones de Fuentes (Fonts)

Las fuentes (especialmente **Nerd Fonts** necesarias para Starship y terminales modernas) se instalan en ubicaciones específicas:

### macOS
| Tipo | Ubicación |
|------|-----------|
| **Usuario** (recomendado) | `~/Library/Fonts/` |
| **Sistema** (requiere admin) | `/Library/Fonts/` |
| **Instalación con Homebrew** | `/opt/homebrew/Caskroom/font-*/` → Se copian a `~/Library/Fonts/` |

**Cómo instalar fuentes en macOS:**
```bash
# Con Homebrew (recomendado)
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font
brew install font-jetbrains-mono-nerd-font

# Manual: Arrastrar archivos .ttf/.otf a Font Book o a ~/Library/Fonts/
```

### Linux (Debian/Ubuntu)
| Tipo | Ubicación |
|------|-----------|
| **Usuario** (recomendado) | `~/.local/share/fonts/` |
| **Sistema** (requiere admin) | `/usr/share/fonts/` o `/usr/local/share/fonts/` |

**Cómo instalar fuentes en Linux:**
```bash
# Crear directorio si no existe
mkdir -p ~/.local/share/fonts

# Copiar archivos .ttf/.otf
cp *.ttf ~/.local/share/fonts/

# Actualizar caché de fuentes
fc-cache -fv
```

### Windows
| Tipo | Ubicación |
|------|-----------|
| **Usuario** | `%USERPROFILE%\AppData\Local\Microsoft\Windows\Fonts\` |
| **Sistema** (requiere admin) | `C:\Windows\Fonts\` |
| **Instalación con Scoop** | `%USERPROFILE%\scoop\apps\*-nerd-font\` → Se instalan en sistema |

**Cómo instalar fuentes en Windows:**
```powershell
# Con Scoop (recomendado)
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF

# Manual: Clic derecho en archivo .ttf/.otf → "Instalar"
# O arrastrar a C:\Windows\Fonts\
```

### Fuentes recomendadas para este setup
- **JetBrains Mono Nerd Font** - Moderna, con ligaduras
- **Meslo LG Nerd Font** - Recomendada por Starship
- **FiraCode Nerd Font** - Popular, con ligaduras
- **Hack Nerd Font** - Clara y legible

**¿Por qué Nerd Fonts?**
Las Nerd Fonts incluyen miles de iconos y símbolos necesarios para que Starship muestre correctamente los iconos de git, lenguajes de programación, etc.

## Ubicaciones de Instalación de Lenguajes de Programación

Esta sección explica **dónde se instalan físicamente** los lenguajes según el método usado.

### Con gestores de versiones (mise, asdf, nvm, pyenv, etc.)

**Mise** (recomendado):
```
~/.local/share/mise/installs/
├── python/
│   ├── 3.11.5/
│   ├── 3.13.2/
│   └── 3.14.0/
├── node/
│   ├── 20.10.0/
│   └── 22.0.0/
├── ruby/
│   └── 3.3.0/
└── go/
    └── 1.21.0/
```

**Otros gestores de versiones**:
| Gestor | Ubicación |
|--------|-----------|
| **asdf** | `~/.asdf/installs/` |
| **nvm** (Node) | `~/.nvm/versions/node/` |
| **pyenv** (Python) | `~/.pyenv/versions/` |
| **rbenv** (Ruby) | `~/.rbenv/versions/` |

### Con instaladores tradicionales

#### macOS

**Instalador oficial (python.org, nodejs.org, etc.)**:
```
/Library/Frameworks/Python.framework/Versions/
├── 3.11/
├── 3.12/
└── 3.14/

# Enlaces simbólicos en:
/usr/local/bin/python3
/usr/local/bin/python3.14
```

**Homebrew**:
```
/opt/homebrew/Cellar/
├── python@3.14/3.14.0/
├── node@22/22.0.0/
└── ruby/3.3.0/

# Enlaces simbólicos en:
/opt/homebrew/bin/python3
/opt/homebrew/bin/node
/opt/homebrew/bin/ruby
```

**Sistema (preinstalado)**:
```
/usr/bin/python3  # Versión antigua, NO modificar
/bin/zsh          # Shell preinstalado
/bin/bash         # Shell preinstalado
```

#### Linux (Debian/Ubuntu)

**Gestor de paquetes (apt)**:
```
/usr/bin/
├── python3
├── node
└── ruby

# Librerías en:
/usr/lib/python3.x/
```

**Instalación manual**:
```
/usr/local/bin/    # Binarios
/usr/local/lib/    # Librerías
```

#### Windows

**Instaladores oficiales**:
```
C:\Program Files\
├── Python314\
├── nodejs\
└── Ruby33\
```

**Scoop** (gestor de paquetes):
```
%USERPROFILE%\scoop\apps\
├── python\3.14.0\
├── nodejs\22.0.0\
└── ruby\3.3.0\
```

### Comparación: ¿Qué método usar?

| Método | Múltiples versiones | Cambio automático por proyecto | Recomendado para |
|--------|---------------------|-------------------------------|------------------|
| **Mise/asdf** | ✅ Ilimitadas | ✅ Sí (con .mise.toml) | Desarrollo profesional |
| **Instalador oficial** | ⚠️ Sí, pero manual | ❌ No | Uso simple |
| **Homebrew** | ⚠️ Limitado | ❌ No | macOS, uso general |
| **Gestor de paquetes (apt/yum)** | ❌ Una sola | ❌ No | Servidores Linux |

### Estrategia recomendada en este proyecto

**Para desarrollo** (lo que usamos):
- ✅ **Mise** para lenguajes de programación (Python, Node, Ruby, Go, etc.)
- ✅ **Homebrew** solo para herramientas del sistema (mise, starship, git, wezterm, etc.)
- ❌ **NO mezclar** instaladores oficiales con Mise para el mismo lenguaje

**Ventajas**:
- Sin conflictos de PATH
- Cambio automático de versiones por proyecto
- Fácil de replicar en otras máquinas
- Una sola ubicación para gestionar: `~/.local/share/mise/`

## Configuración de Mise

Mise tiene dos niveles de configuración:

### 1. Configuración Global (sistema)
**Archivo**: `~/.config/mise/config.toml`

Este archivo se crea automáticamente cuando usas `mise use --global <lenguaje>@<versión>`.

**Ejemplo**:
```toml
[tools]
python = "3.14.0"
node = "22.0.0"
```

**¿Qué hace?**
- Define las versiones "por defecto" del sistema
- Se usa cuando NO estás en un proyecto con `.mise.toml` propio
- Es tu fallback global

**¿Debe ir en dotfiles?**
- ❌ **NO** (recomendado) - Cada máquina puede tener versiones diferentes según necesidades
- ✅ **SÍ** (opcional) - Si quieres replicar las mismas versiones globales en todas tus máquinas

**En este proyecto**: NO se incluye en el repo. Se crea manualmente en cada máquina.

### 2. Configuración por Proyecto
**Archivo**: `.mise.toml` (en la raíz del proyecto) o `.tool-versions`

**Ejemplo**:
```toml
[tools]
python = "3.11.0"
node = "20.10.0"
```

**¿Qué hace?**
- Define versiones específicas para ese proyecto
- **Override** (sobrescribe) la configuración global
- Cuando entras a esa carpeta, mise cambia automáticamente las versiones

**¿Debe ir en dotfiles?**
- ❌ **NO** - Va en el repositorio de cada proyecto, no en dotfiles-anywhere
- Cada proyecto gestiona sus propias dependencias

### Resumen de ubicaciones de Mise

| Tipo | Ubicación | Propósito | En dotfiles? |
|------|-----------|-----------|--------------|
| **Binarios de mise** | `/opt/homebrew/bin/mise` | El programa en sí | ❌ No |
| **Config global** | `~/.config/mise/config.toml` | Versiones por defecto del sistema | ❌ No (opcional ✅) |
| **Lenguajes instalados** | `~/.local/share/mise/installs/` | Las instalaciones de Python, Node, etc. | ❌ NUNCA (muy pesado) |
| **Config por proyecto** | `<proyecto>/.mise.toml` | Versiones del proyecto | ❌ No (va en repo del proyecto) |
| **Activación en shell** | `eval "$(mise activate zsh)"` en `.zshrc` | Activa mise en el shell | ✅ Sí (en `.zshrc`) |

### Notas sobre las instalaciones

**macOS:**
- Programas instalados con Homebrew van a `/opt/homebrew/` (Apple Silicon) o `/usr/local/` (Intel)
- Aplicaciones con interfaz gráfica (.app) van a `/Applications/`
- Homebrew se instala en: `/opt/homebrew/` (Apple Silicon)

**Linux:**
- Programas del gestor de paquetes (apt/yum) van a `/usr/bin/`
- Instalaciones manuales suelen ir a `/usr/local/bin/`
- Programas en snap van a `/snap/`

**Windows:**
- Instaladores tradicionales: `C:\Program Files\` o `C:\Program Files (x86)\`
- Scoop (gestor de paquetes): `%USERPROFILE%\scoop\apps\`
- Chocolatey: `C:\ProgramData\chocolatey\`
- Winget instala en ubicaciones estándar de Windows

### ¿Por qué usar un repositorio de dotfiles?
- **Portabilidad**: Llevar tu configuración a cualquier máquina
- **Backup**: Respaldo automático de tus configuraciones
- **Versionado**: Historia de cambios con git
- **Sincronización**: Mantener múltiples máquinas con la misma configuración

## Estructura del Proyecto

### common/ vs específico por SO
- **`common/`**: Archivos que funcionan igual en Windows, Linux y macOS (ej: configuración de git, starship, wezterm)
- **`macos/`, `linux/`, `windows/`**: Configuraciones específicas del sistema operativo (ej: `.zshrc` para macOS, `.bashrc` para Linux)

### ¿Por qué copiar en lugar de usar symlinks?
En este proyecto usamos **copias** en lugar de enlaces simbólicos (symlinks) porque:
- **Más simple**: No hay que preocuparse por permisos especiales
- **Compatible**: Funciona en todos los sistemas sin configuración adicional
- **Git-friendly**: Usamos git para controlar versiones, no necesitamos que los cambios se reflejen automáticamente
- **Flexibilidad**: Puedes modificar archivos localmente sin afectar el repo inmediatamente

## Scripts de Instalación

### Modo DRY RUN
Por defecto, los scripts ejecutan en modo **DRY RUN** (simulación):
- Solo **muestran** qué harían
- **NO modifican** ningún archivo
- Útil para revisar cambios antes de aplicarlos

Para aplicar cambios reales:
```bash
export DRY_RUN=0 && ./install.sh
```

### Flujo de trabajo

1. **Editar** archivos en el repositorio (`~/dotfiles-anywhere/`)
2. **Probar** con DRY RUN: `./install.sh`
3. **Aplicar** cambios: `DRY_RUN=0 ./install.sh`
4. **Commitear** al repositorio: `git add . && git commit -m "mensaje"`

## Configuraciones Incluidas

### WezTerm
Terminal multiplataforma moderno con configuración en Lua.
- **Tema**: Catppuccin Mocha
- **Características**: Ventana con transparencia y blur en macOS

### Starship
Prompt personalizable para cualquier shell.
- **Preset**: Catppuccin Powerline
- **Ventajas**: Rápido, muestra info de git, lenguajes, etc.

### Git
Configuración global de git.
- **Usuario**: Nombre y email
- **Editor**: VSCode
- **Branch por defecto**: main
- **SSH**: Usa SSH en lugar de HTTPS para GitHub

### Zsh (macOS)
Shell por defecto en macOS.
- **Framework**: Oh My Zsh
- **Plugins**: git
- **Prompt**: Starship (reemplaza el tema de Oh My Zsh)

## Comandos Útiles

### Ver cambios antes de commitear
```bash
git status          # Ver archivos modificados
git diff            # Ver cambios en detalle
git diff --staged   # Ver cambios en staging
```

### Revertir cambios
```bash
git checkout <archivo>           # Descartar cambios no commiteados
git reset HEAD <archivo>         # Sacar archivo de staging
git revert <commit>              # Revertir un commit específico
git log --oneline                # Ver historial de commits
```

### Probar el script de instalación
```bash
cd macos/scripts
./install.sh                     # Modo DRY RUN (seguro)
DRY_RUN=0 ./install.sh          # Aplicar cambios reales
```

## Preguntas Frecuentes

### ¿Qué hace `set -e` en el script?
Hace que el script se detenga inmediatamente si cualquier comando falla. Es una medida de seguridad.

### ¿Qué son los códigos ANSI de colores?
Códigos especiales para colorear texto en la terminal:
- `\033[0;32m` = Verde
- `\033[1;33m` = Amarillo
- `\033[0;34m` = Azul
- `\033[0m` = Reset (volver a color normal)

### ¿Por qué gitconfig está en common/ y no en macos/?
Porque la configuración de git funciona igual en los 3 sistemas operativos. Solo cambiaría si necesitas configuraciones específicas (ej: diferentes credenciales por SO).

### ¿Debo hacer backup manual antes de usar el script?
No es necesario porque:
1. El script corre en DRY RUN por defecto
2. Puedes revertir cambios con git
3. Tus configuraciones están en el repositorio

## Próximos Pasos

- [ ] Agregar configuración de Neovim
- [ ] Crear script de instalación para Linux
- [ ] Crear script de instalación para Windows
- [ ] Agregar lista de programas a instalar (Homebrew/APT/Scoop)
- [ ] Documentar dependencias necesarias

## Recursos

- [Starship Documentation](https://starship.rs/)
- [WezTerm Documentation](https://wezfurlong.org/wezterm/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Dotfiles Guide](https://dotfiles.github.io/)

---

**Última actualización**: 2025-11-30
