{ lib, inputs, baseVars, hostVars, ... }:

{
    imports = [
        inputs.home-manager.nixosModules.home-manager
        (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" baseVars.username ])
    ];

    home-manager.sharedModules = [
        inputs.helium.homeModules.default
        inputs.mangowm.hmModules.mango
    ];

    hm.home.stateVersion = hostVars.stateVersion;

    hm.xdg.userDirs = {
        enable = true;
        createDirectories = true;

        documents = "/home/nora/2besita/Textic";
        pictures = "/home/nora/2besita/Imagetic";
        download = "/home/nora/Downloads";
        music = "/home/nora/2besita/Music";
        videos = "/home/nora/2besita/Cinematic";
        desktop = "/home/nora/2besita";
        projects = "/home/nora/2besita/tichel";

        publicShare = null;
        templates = null;
    };
}
