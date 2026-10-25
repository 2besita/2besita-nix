{ pkgs, baseVars, ...}:
{
    hm.home.packages = with pkgs; [
        foot kitty emacs-pgtk zip unzip
        imagemagick ffmpeg unrar mpc rmpc
        yt-dlp gnutar ripgrep wget ani-cli
        senpai
    ];

    hm.programs.fish = {
        enable = true;
      
        functions.fish_greeting = "";

        shellAliases = {
            ls =        "eza --icons=always --group-directories-first";
            la =        "eza --all --icons=always --group-directories-first";
            ll =        "eza --long --all --git --icons=always --group-directories-first";
            tree =      "eza --tree --icons";
            f =         "fzf";
            l =         "ll | bat -l conf -p --theme=ansi";
            lsblk =     "lsblk | bat --theme ansi -l conf -p";
            bat =       "bat -l c -p --theme=ansi";
            dev =       "nix develop -c fish";
            doedit =    "doas env HOME=$HOME nvim";
        };
    };

    hm.programs.starship = {
        enable = true;
    	enableFishIntegration = true;
        configPath = "/home/${baseVars.username}/.config/starship/nora.toml";
    };
}
