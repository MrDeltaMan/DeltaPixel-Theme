#!/bin/bash

# Cores para o terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # Sem cor

echo -e "${BLUE}======================================"
echo -e "   DeltaPixel Theme - Installer"
echo -e "======================================${NC}\n"

# 1. Criando diretórios necessários
echo -e "${BLUE}[*] Criando diretórios...${NC}"
mkdir -p ~/.fonts
mkdir -p ~/.icons
mkdir -p ~/.themes
mkdir -p ~/.local/share/applications
mkdir -p ~/.config/cinnamon

# 2. Instalando Fontes
echo -e "${BLUE}[*] Instalando fontes...${NC}"
cp -r .fonts/* ~/.fonts/
fc-cache -fv > /dev/null
echo -e "${GREEN}[V] Fontes instaladas!${NC}"

# 3. Instalando Ícones e Temas
echo -e "${BLUE}[*] Instalando ícones e temas...${NC}"
cp -r .icons/* ~/.icons/
cp -r .themes/* ~/.themes/
echo -e "${GREEN}[V] Ícones e Temas copiados!${NC}"

# 4. Instalando .desktop files (Menu)
echo -e "${BLUE}[*] Configurando atalhos do menu...${NC}"
if [ -d "dotfiles/menus" ]; then
    cp -r dotfiles/menus/*.desktop ~/.local/share/applications/
fi
echo -e "${GREEN}[V] Atalhos adicionados!${NC}"

# 5. Applets do Cinnamon
echo -e "${BLUE}[*] Instalando applets...${NC}"
mkdir -p ~/.local/share/cinnamon/applets
cp -r dotfiles/cinnamon/applets/* ~/.local/share/cinnamon/applets/
echo -e "${GREEN}[V] Applets instalados!${NC}"

# 6. Alerta sobre o DCONF (Configurações do Cinnamon)
echo -e "\n${BLUE}======================================"
echo -e "   NOTAS IMPORTANTES"
echo -e "======================================${NC}"
echo -e "1. Para aplicar as configs do Cinnamon, rode manualmente:"
echo -e "   dconf load /org/cinnamon/ < dotfiles/cinnamon/cinnamon.dconf"
echo -e ""
echo -e "2. O ícone do menu (DELTA.png) está em ./assets/"
echo -e "   Altere-o manualmente nas configurações do applet de menu."
echo -e ""
echo -e "3. Reinicie o Cinnamon (Alt+F2, digite 'r' e Enter) para ver as mudanças."
echo -e "${GREEN}Instalação concluída!
