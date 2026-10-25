{ pkgs, ... }:
{
    hm.home.packages = with pkgs; [
        waybar fuzzel dunst awww matugen
        grim wl-clipboard wl-screenrec
        qt5.qtbase qt6.qtbase yazi pipes
        chafa fastfetch eza slurp
        tree btop wl-kbptr wayfreeze
    ];

    hm.wayland.windowManager.mango = {
        enable = true;
        systemd.variables = [
            "DISPLAY"
            "WAYLAND_DISPLAY"
            "XDG_CURRENT_DESKTOP"
            "XDG_SESSION_TYPE"
            "NIXOS_OZONE_WL"
            "XCURSOR_THEME"
            "XCURSOR_SIZE"
        ];
        extraConfig = ''
            source=./main.conf

            source=./hardware/input.conf
            source=./hardware/output.conf
            
            source=./mango/animations.conf
            source=./mango/colors.conf
            source=./mango/keymaps.conf
            source=./mango/layout.conf
            source=./mango/rules.conf
        '';
        
        autostart_sh = ''
            waybar &
            awww-daemon &
            dunst &
            systemctl --user start mpd &
        '';
    };
}
