{ pkgs, inputs, ... }:
{
    hm.home.packages = with pkgs; [

        (inputs.curd.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (_: { doCheck = false; }))
        inputs.flec.packages.${pkgs.stdenv.hostPlatform.system}.default
        inputs.yum.packages.${pkgs.stdenv.hostPlatform.system}.default
        inputs.nock.packages.${pkgs.stdenv.hostPlatform.system}.default

        pulseaudioFull pavucontrol
        inotify-tools loupe zathura
        nautilus nicotine-plus nwg-look
        obs-studio krita gimp mpv
        vesktop proton-vpn protonmail-desktop
        picard

        libnotify qemu mpd-discord-rpc
    ];

    programs = {
        xwayland.enable = true;
        gamescope.enable = true;
        gamemode.enable = true;
        dconf.enable = true;
        kdeconnect.enable = true;
    };
}
