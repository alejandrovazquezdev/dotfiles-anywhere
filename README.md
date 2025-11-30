# Dotfiles multi-SO - Estructura híbrida

Objetivo: repo único para Windows, Debian/Linux y macOS, con dotfiles compartidos y despliegue por SO. 

## Estructura

```
dotfiles/
├── common/              # Dotfiles compartidos entre los 3 SO
│   ├── nvim/            # Configuración de Neovim (~/.config/nvim)
│   ├── starship.toml    # Configuración de Starship (~/.config/starship.toml)
│   └── ... 
├── windows/             # Específicos de Windows
│   ├── PowerShell/
│   │   └── Microsoft. PowerShell_profile.ps1
│   └── scripts/
│       └── install. ps1  # Script de despliegue para Windows
├── linux/               # Específicos de Debian/Linux
│   ├── .bashrc
│   └── scripts/
│       └── install.sh   # Script de despliegue para Linux
├── macos/               # Específicos de macOS
│   ├── .zshrc
│   └── scripts/
│       └── install.sh   # Script de despliegue para macOS
├── README. md
└── .gitignore
```

## Uso

### 1. Clonar el repositorio
```bash
git clone git@github.com:tu-usuario/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Desplegar dotfiles en tu sistema

#### En macOS
```bash
cd macos/scripts
./install.sh
```

#### En Linux (Debian/Ubuntu)
```bash
cd linux/scripts
./install.sh
```

#### En Windows (PowerShell)
```powershell
cd windows\scripts
.\install.ps1
```

**Nota:** Los scripts ejecutan en modo DRY RUN por defecto (solo muestran qué harían sin aplicar cambios). 

### 3. Aplicar cambios reales
Para ejecutar el despliegue real (copiar/enlazar archivos):

**POSIX (macOS/Linux):**
```bash
export DRY_RUN=0
./install.sh
```

**Windows:**
```powershell
$env:DRY_RUN = 0
.\install.ps1
```

### 4.  Guardar cambios al repositorio
Los scripts despliegan archivos **desde** el repo **hacia** tu sistema.  Para guardar cambios que hagas localmente:

1. Edita los archivos directamente en el repo (`~/dotfiles/common/nvim/... `, etc.)
2. Revisa los cambios:
   ```bash
   git diff
   ```
3. Añade y commitea:
   ```bash
   git add .
   git commit -m "Descripción de cambios"
   git push
   ```

## Notas importantes

### Seguridad
- Los scripts **no sobrescriben** archivos existentes sin confirmación explícita
- Modo DRY RUN activado por defecto para revisar cambios antes de aplicarlos
- Se recomienda hacer backup manual de configuraciones importantes antes del primer despliegue

### Dotfiles compartidos (common/)
Los archivos en `common/` se despliegan a ubicaciones estándar en los 3 SO:
- **macOS/Linux:** `~/.config/`
- **Windows:** `$env:USERPROFILE\.config\` o `$env:LOCALAPPDATA\`

### Overrides específicos por SO
Si un archivo existe tanto en `common/` como en la carpeta del SO (p. ej., `windows/`), el específico del SO tiene prioridad y sobrescribe el común durante el despliegue.

### Symlinks vs. Copias
- Por defecto, los scripts intentan crear **enlaces simbólicos** (symlinks)
- Si fallan (p. ej., en Windows sin Modo Desarrollador o permisos), hacen **copia** como fallback
- Ventaja de symlinks: los cambios en el repo se reflejan inmediatamente en el sistema

### Gestión de secretos
**NO incluyas** credenciales, tokens o secretos en este repositorio. Usa:
- Variables de entorno locales (`. env. local`, no trackeadas)
- Gestores de secretos del SO
- Archivos `. local` excluidos en `. gitignore`

## Herramientas soportadas

### Compartidas (common/)
- Neovim
- Starship
- Git (. gitconfig)
- Mise/asdf

### Por sistema operativo

**Windows:**
- PowerShell (perfil en `$PROFILE`)
- Scoop (manifests/lista de paquetes)

**Linux:**
- Bash (. bashrc, .bash_aliases)
- APT (lista de paquetes opcionales)

**macOS:**
- Zsh (.zshrc, .zprofile)
- Homebrew (Brewfile opcional)

## Próximos pasos

1. **Auditar dotfiles actuales:** revisa qué configuraciones tienes en tu sistema antes de desplegar
2. **Personalizar scripts:** ajusta las rutas y archivos en `install.sh`/`install.ps1` según tus necesidades
3. **Añadir manifests:** crea listas de paquetes/herramientas para bootstrap rápido en máquinas nuevas
4. **Documentar dependencias:** anota qué herramientas requieren instalación previa (mise, starship, etc.)

## Reversión
Para deshacer el despliegue, elimina los symlinks o archivos copiados manualmente:

**POSIX:**
```bash
rm ~/. config/nvim  # Si es symlink
rm ~/.config/starship.toml
```

**Windows:**
```powershell
Remove-Item $env:USERPROFILE\.config\nvim -Force
```

---

**Mantenido por:** alejandrovazquezdev  
**Última actualización:** 2025-11-30
```