{ pkgs, ... }:
{
    hm.home.packages = with pkgs; [
        heroic hydralauncher mangohud mangojuice lact azahar
        protonplus wine-staging protontricks rpcs3
    ];

    programs = {
        gamescope.enable = true;
        gamemode.enable = true;
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
        };
    };
}
