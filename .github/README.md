 <html>
  <body>
    <br>
    <p align="center"><img src='https://i.postimg.cc/gkQZpTMN/greenhypr.png' width='600'></p>
    <br>
    <p align="left"><img src='https://i.postimg.cc/7YkGqmJ4/test.png' width='700'></p>
    <p align="right"><img src='https://i.postimg.cc/Nfz31P8q/test2.png' width='700'></p>
    <p align="left"><img src='https://i.postimg.cc/XqvP5wpY/test3.png' width='700'></p>
    <br>
   
   ## 💚 Thanks for stopping by!
   
   <p>Welcome to my Hyprland configuration files!</p>
   <p>In this repository you will find all my configuration files and learn how to troubleshoot some errors that may occur during the process.</p>
   <p>Feel free to use anything from here, just remember to give me credit! :)</p>
   <br>
   
   ## ⚠️ Details to keep in mind
   <ul>
    <li>The installation will perform best on a physical machine. Virtual machines tend to cause more problems in Hyprland, except with KVM virtualization.</li>
    <li>The installation process using the script must be performed on a clean Arch Linux system, from the TTY.</li>
    <li>Before running the script to install the configurations, you must install the dependencies and packages.</li>
  </ul>
  <br>
   
   ## 🔧 Procedure to install
   <h4>To install and configure dotfiles, follow these steps:</h4>
   <br>
   <p>1️⃣ Install dependencies:</p>

   ```sh
    sudo pacman -Syu && git clone https://aur.archlinux.org/yay-git.git && cd yay-git && makepkg -si
   ```
   ❗ You can install it from the requirements.sh file
   
   <p>2️⃣ Install packages:</p>

   ```sh
    yay -S --noconfirm hyprland-git kitty wl-clip-persist sddm-theme-sugar-candy-git megatools xwaylandvideobridge eww wl-gammarelay &&
    sudo pacman -S --noconfirm wofi sddm zsh lsd bat zsh-syntax-highlighting zsh-autosuggestions hypridle hyprpaper hyprlock waybar polkit polkit-gnome pavucontrol slurp grim swappy fastfetch wget unzip pamixer wl-clipboard
   ```
   ❗ You can install it from the requirements.sh file
   
   <p>3️⃣ Download repository:</p>
   
   ```sh
     git clone https://github.com/f3l3p1n0/bluehypr.git
   ```

   <p>4️⃣ Access the bluehypr directory:</p>

   ```sh
    cd bluehypr
   ```

   <p>5️⃣ Run the installer:</p>
   
   ```sh
    bash install.sh
   ```
 
   <p>6️⃣ Let the installation finish. Then reboot.</p>
   <p>Here's a video if you'd like a more guided installation: https://youtu.be/4q_DGGN_BWY</p>
   <br>

   ## 📷 ‎Gallery
   
   | <b>Powermenu</b>                                                                                     |
   | ---------------------------------------------------------------------------------------------------- |
   | <a href="#--------"><img src="assets/powermenu.gif" width="500px" alt="bottom panel preview"></a>    |

   | <b>Workspaces</b>                                                                                    |
   | ---------------------------------------------------------------------------------------------------- |
   | <a href="#--------"><img src="assets/workspaces.gif" width="500px" alt="bottom panel preview"></a>   |

   | <b>Calendar</b>                                                                                     |
   | ----------------------------------------------------------------------------------------------------|
   | <a href="#--------"><img src="assets/calendar.gif" width="500px" alt="bottom panel preview"></a>    |

   | <b>Volume</b>                                                                                       |
   | ----------------------------------------------------------------------------------------------------|
   | <a href="#--------"><img src="assets/volume.gif" width="500px" alt="bottom panel preview"></a>      |

   | <b>Launcher</b>                                                                                     |
   | ----------------------------------------------------------------------------------------------------|
   | <a href="#--------"><img src="assets/launcher.gif" width="500px" alt="bottom panel preview"></a>    |

   <br>
   
   ## ❌ Possible Problems and Solutions
   <h4>This section will cover possible problems and solutions as they arise:</h4>
   <h5>◻️<ins> Wallpaper is not applied upon login</ins></h5>
   <p>You need to go to the hyprpaper configuration: <strong>nano.config/hypr/hyprpaper.conf</strong></p>
   <p>Then, change the monitor name to the name of your monitor</p>
   <p>To find your monitor name, type the following in the terminal: <strong>hyprctl monitors</strong></p>
   
   <h5>◻️<ins> The power menu is displayed distorted or is not working</ins></h5>
   <p>In my case, the power menu is configured to display correctly at 1920x1080 resolution. If you are not seeing it correctly, you should go to the following path: <strong>cd ~/.config/rofi/powermenu/</strong></p>
   <p>Then, you should open the file <strong>config.rasi</strong></p>
   <p>In this file, you must modify the line: <strong>mainbox-margin</strong> in the Global Properties section. Adjust the parameters to your liking; you can try <strong>15px 40px</strong>.</p>
   
   <h5>◻️<ins> Waybar doesn't load when logging in</ins></h5>
   <p>You need to open the Waybar configuration: <strong>nano.config/waybar/config.jsonc</strong></p>
   <p>In the file, you need to modify the <strong>output</strong> section to change the monitor name.</p>

   <h5>◻️<ins> The power menu or calendar is not appearing</ins></h5>
   <p>In the <strong>.config/eww/eww.yuck</strong> configuration, you need to modify the values ​​of :x and :y to position the widgets correctly. Try :x "0" and :y "0".</p>
   <p>Also in the same "eww.yuck" configuration, you need to modify the value of :monitor, as they may be starting on a different monitor if you have more than one.</p>
   <br>
   
   ## 👤 Author
   <p><a href="https://github.com/f3l3p1n0">f3l3p1n0</a></p> 
  </body>
 </html>
