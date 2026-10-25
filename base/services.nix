{ config, pkgs, lib, baseVars, ... }:

let
    yaziPicker = "${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh";
in

{
    virtualisation.waydroid.enable = true;

    systemd.services.flatpak-repo = {
        wantedBy = [ "multi-user.target" ];
        path = [ pkgs.flatpak ];
        script = "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo";
    };

    hm.xdg.configFile."xdg-desktop-portal-termfilechooser/config".text = ''
        [filechooser]
        cmd=${yaziPicker}
        env=TERMCMD='foot -T "file picker"'
    '';

    xdg.portal = {
        enable = true;
        extraPortals = [
            pkgs.xdg-desktop-portal-termfilechooser
            pkgs.xdg-desktop-portal-gtk
        ];

        config = {
            common = {
                default = [ "*" ];
                "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
            };
        };
    };

    services = {
        printing.enable = true;
        lact.enable = true;
        tailscale.enable = true;
        flatpak.enable = true;
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            wireplumber.enable = true;
        };
    };

    hm.services.mpd = {
        enable = true;
        musicDirectory = "/home/${baseVars.username}/2besita/Music";
        playlistDirectory = "/home/${baseVars.username}/.config/mpd/playlists";
        dbFile = "/home/${baseVars.username}/.config/mpd/mpd.db";

        network.listenAddress = "127.0.0.1";
        network.port = 6600;

        extraConfig = ''
            log_file           "/home/${baseVars.username}/.config/mpd/mpd.log"
            state_file         "/home/${baseVars.username}/.config/mpd/mpdstate"
            sticker_file       "/home/${baseVars.username}/.config/mpd/sticker.sql"
            auto_update        "yes"

            audio_output {
                type            "pipewire"
                name            "PipeWire Sound Server"
            }

            audio_output {
                type            "fifo"
                name            "Visualizer feed"
                path            "/home/${baseVars.username}/.config/mpd/mpd.fifo"
                format          "44100:16:2"
            }
        '';
    };

    hm.services.mpdscribble = {
        enable = true;
        endpoints = {
            "last.fm" = {
                username = "twobesita";
                passwordFile = "/home/${baseVars.username}/.config/mpdscribble/mpdscribble.txt";
            };
        };
    };

    hm.services.mpd-discord-rpc = {
        enable = true;
        settings = {
            format = {
                details = "$title";
                state = "by $artist";
                large_text = "on $album";
                small_image = "$album";
                large_image = "$album";
            };
        };
    };
}
