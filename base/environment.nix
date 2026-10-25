{ config, ... }:
{
    environment = {
        localBinInPath = true;
        sessionVariables = {
            GTK_IM_MODULE = "simple";
            QT_IM_MODULE = "simple";
            XMODIFIERS = "simple";
            TERMINAL = "foot";
            EDITOR = "nvim";
            VISUAL = "nvim";
            MOZ_ENABLE_WAYLAND = "1";
            NIXOS_OZONE_WL = "1";
        };

        variables = {
            GTK_USE_PORTAL = "1";
            GDK_DEBUG = "portals";
        };
    };
}
