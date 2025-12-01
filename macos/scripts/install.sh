#!/bin/bash

# Script de instalación de dotfiles para macOS
# Por defecto ejecuta en modo DRY RUN (solo muestra qué haría sin aplicar cambios)
# Para aplicar cambios: export DRY_RUN=0 && ./install.sh

set -e

# Colores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuración
DOTFILES_DIR="$HOME/dotfiles-anywhere"
DRY_RUN=${DRY_RUN:-1}

# Banner
echo ""
echo "═══════════════════════════════════════════════════════"
echo "  Instalación de dotfiles para macOS"
echo "═══════════════════════════════════════════════════════"
echo ""

if [ "$DRY_RUN" -eq 1 ]; then
    echo -e "${YELLOW}⚠${NC} Modo DRY RUN - no se aplicarán cambios"
    echo -e "${BLUE}ℹ${NC} Para aplicar: export DRY_RUN=0 && ./install.sh"
    echo ""
fi

# WezTerm
echo -e "${BLUE}ℹ${NC} Instalando WezTerm..."

# Crear directorio si no existe
if [ ! -d "$HOME/.config/wezterm" ]; then
    if [ "$DRY_RUN" -eq 1 ]; then
        echo -e "${BLUE}ℹ${NC} [DRY RUN] Crearía: ~/.config/wezterm/"
    else
        mkdir -p "$HOME/.config/wezterm"
        echo -e "${GREEN}✓${NC} Directorio creado: ~/.config/wezterm/"
    fi
fi

# Copiar archivo
if [ "$DRY_RUN" -eq 1 ]; then
    echo -e "${BLUE}ℹ${NC} [DRY RUN] Copiaría: common/wezterm/wezterm.lua -> ~/.config/wezterm/wezterm.lua"
else
    cp "$DOTFILES_DIR/common/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"
    echo -e "${GREEN}✓${NC} Copiado: ~/.config/wezterm/wezterm.lua"
fi

# Starship
echo -e "${BLUE}ℹ${NC} Instalando Starship..."

if [ ! -d "$HOME/.config" ]; then
    if [ "$DRY_RUN" -eq 1 ]; then
        echo -e "${BLUE}ℹ${NC} [DRY RUN] Crearía: ~/.config/"
    else
        mkdir -p "$HOME/.config"
        echo -e "${GREEN}✓${NC} Directorio creado: ~/.config/"
    fi
fi

if [ "$DRY_RUN" -eq 1 ]; then
    echo -e "${BLUE}ℹ${NC} [DRY RUN] Copiaría: common/starship.toml -> ~/.config/starship.toml"
else
    cp "$DOTFILES_DIR/common/starship.toml" "$HOME/.config/starship.toml"
    echo -e "${GREEN}✓${NC} Copiado: ~/.config/starship.toml"
fi

# zshrc
echo -e "${BLUE}ℹ${NC} Instalando zshrc..."

if [ "$DRY_RUN" -eq 1 ]; then
    echo -e "${BLUE}ℹ${NC} [DRY RUN] Copiaría: macos/.zshrc -> ~/.zshrc"
else
    cp "$DOTFILES_DIR/macos/.zshrc" "$HOME/.zshrc"
    echo -e "${GREEN}✓${NC} Copiado: ~/.zshrc"
fi

# gitconfig
echo -e "${BLUE}ℹ${NC} Instalando gitconfig..."

if [ "$DRY_RUN" -eq 1 ]; then
    echo -e "${BLUE}ℹ${NC} [DRY RUN] Copiaría: common/.gitconfig -> ~/.gitconfig"
else
    cp "$DOTFILES_DIR/common/.gitconfig" "$HOME/.gitconfig"
    echo -e "${GREEN}✓${NC} Copiado: ~/.gitconfig"
fi

# Resumen
echo ""
echo "═══════════════════════════════════════════════════════"
if [ "$DRY_RUN" -eq 1 ]; then
    echo -e "${BLUE}ℹ${NC} Modo DRY RUN - ningún cambio aplicado"
    echo -e "${BLUE}ℹ${NC} Para aplicar: export DRY_RUN=0 && ./install.sh"
else
    echo -e "${GREEN}✓${NC} Instalación completada"
fi
echo "═══════════════════════════════════════════════════════"
echo ""
