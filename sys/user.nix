{ pkgs, baseVars, ... }:
{
    programs.fish.enable = true;
    users.users.${baseVars.username} = {
        isNormalUser = true;
        description = "nora";
        shell = pkgs.fish;
        extraGroups = [
            "networkmanager"
            "wheel" "power"
            "video" "audio"
        ];
    };
}
