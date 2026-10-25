{ pkgs, ...}:
{
    hm.home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono google-fonts
        plemoljp-nf nerd-fonts.terminess-ttf
        nerd-fonts.iosevka

        (colloid-icon-theme.override { colorVariants = [ "grey" "teal" ]; })
    ];


    environment.systemPackages = with pkgs; [
        bibata-cursors
    ];

    hm.fonts.fontconfig.enable = true;
}
