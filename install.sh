#!/bin/bash

############################################################################################################################
#                                                   SCRIPT BY F3L3P1N0                                                     #
############################################################################################################################

# AUTHOR
function author() {
    echo -e "\n\e[1;36m         #####################################################"
    echo "         #                 SCRIPT BY F3L3P1N0                #"
    echo -e "         #####################################################\e[0m\n"
}

# MESSAGE
function message() {
    echo -e "\n\e[1;33mInstalling configuration files. Please wait...\e[0m\n"
}

# Progress variables
total_steps=17
current_step=0
success_color="\e[32m"
error_color="\e[31m"
reset_color="\e[0m"

# Function to print steps with dynamic dots
print_step() {
    local step_name=$1
    local total_length=60
    local step_length=${#step_name}
    local dots_length=$((total_length - step_length - 3))
    ((dots_length < 0)) && dots_length=0
    local dots=$(printf "%0.s•" $(seq 1 $dots_length))
    printf "  \e[1;34m%s \e[0;36m%s" "$step_name" "$dots"
}

# Function to update the progress bar
update_progress() {
    local percent=$((current_step * 100 / total_steps))
    local filled=$((current_step * 50 / total_steps))
    local bar=$(printf "${success_color}%0.s█" $(seq 1 $filled))
    local empty=$(printf "\e[0;37m%0.s░" $(seq 1 $((50 - filled))))
    tput sc
    tput cup $(($(tput lines))) 0
    echo -ne "  Progress: ${bar}${empty}${reset_color} ${percent}%"
    tput rc
}

# COPY CONFIGURATION FILES
function copy_configs() {
    echo -e "\n"
    tput sc

    # Create .config
    print_step "Creating .config"
    mkdir -p "$HOME/.config" >/dev/null 2>&1
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Fastfetch
    print_step "Configuring Fastfetch"
    rm -rf "$HOME/.config/fastfetch" >/dev/null 2>&1
    mkdir -p "$HOME/.config/fastfetch"
    cp -r $1/dotfiles/fastfetch/* "$HOME/.config/fastfetch/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Kitty
    print_step "Configuring Kitty"
    mkdir -p "$HOME/.config/kitty"
    cp -r $1/dotfiles/kitty/* "$HOME/.config/kitty/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Hyprland
    print_step "Configuring Hyprland"
    mkdir -p "$HOME/.config/hypr"
    cp -r $1/dotfiles/hypr/* "$HOME/.config/hypr/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Wallpaper
    print_step "Setting wallpaper"
    mkdir -p "$HOME/Pictures"
    cp $1/dotfiles/wallpaper.png "$HOME/Pictures/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Waybar
    print_step "Configuring Waybar"
    mkdir -p "$HOME/.config/waybar"
    cp -r $1/dotfiles/waybar/* "$HOME/.config/waybar/"
    chmod +x "$HOME/.config/waybar/scripts/"*
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Wofi
    print_step "Configuring Wofi"
    mkdir -p "$HOME/.config/wofi"
    cp -r $1/dotfiles/wofi/* "$HOME/.config/wofi/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Zsh
    print_step "Configuring Zsh"
    sudo usermod --shell /usr/bin/zsh $USER >/dev/null 2>&1
    sudo usermod --shell /usr/bin/zsh root >/dev/null 2>&1
    cp -r "$1/dotfiles/.zshrc" "$HOME/"
    sudo ln -sf "$HOME/.zshrc" "/root/.zshrc"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Powerlevel10k
    print_step "Installing Powerlevel10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k >/dev/null 2>&1
    sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k >/dev/null 2>&1
    cp -r $1/dotfiles/powerlevel10k/user/.p10k.zsh "$HOME/"
    sudo cp -r $1/dotfiles/powerlevel10k/root/.p10k.zsh "/root/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Sudo plugin
    print_step "Installing sudo plugin"
    sudo mkdir -p /usr/share/zsh-sudo
    sudo chown -R $USER:$USER /usr/share/zsh-sudo
    wget -q https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh -P /usr/share/zsh-sudo/
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Fonts
    print_step "Downloading fonts"
    mkdir -p "$1/dotfiles/fonts"
    megadl --print-names https://mega.nz/file/GxFVSLLY#etuNc6QRrEl6wgl_ZatvomojDhkBTFPqlKS7ELk7KAM --path="$1/dotfiles/fonts/" >/dev/null 2>&1
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    print_step "Installing fonts"
    sudo cp -r $1/dotfiles/fonts/* "/usr/share/fonts/"
    sudo unzip -oq /usr/share/fonts/fonts.zip -d /usr/share/fonts/ >/dev/null 2>&1
    sudo rm -f /usr/share/fonts/fonts.zip
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Swappy
    print_step "Configuring Swappy"
    mkdir -p "$HOME/.config/swappy"
    cp -r $1/dotfiles/swappy/* "$HOME/.config/swappy"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # SDDM
    print_step "Configuring SDDM"
    sudo systemctl enable sddm >/dev/null 2>&1
    sudo mkdir -p "/usr/share/sddm/themes/Sugar-Candy/Backgrounds"
    sudo cp $1/dotfiles/sddm/wallpaper.png "/usr/share/sddm/themes/Sugar-Candy/Backgrounds/"
    sudo cp $1/dotfiles/sddm/theme.conf "/usr/share/sddm/themes/Sugar-Candy/"
    sudo cp $1/dotfiles/sddm/sddm.conf "/etc/"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress

    # Eww
    print_step "Configuring Eww"
    mkdir "$HOME/.config/eww" > /dev/null 2>&1
    cp -r $1/dotfiles/eww/* "$HOME/.config/eww"
    echo -e " ${success_color}✓${reset_color}"
    ((current_step++))
    update_progress
}

# COMPLETION
function finish() {
    echo -e "\n\e[1;32mINSTALLATION COMPLETED\e[0m"
    echo -e "\n\e[1;33mRecommendation: Restart your system to apply all changes.\e[0m\n"
}

# Main execution
author
message
copy_configs "$(pwd)"
finish
