{ pkgs, ... }: {
    nix = {
        settings = {
            auto-optimise-store = true;
            experimental-features = [
                "nix-command"
                "flakes"
            ];
            http-connections = 50;
            binary-caches-parallel-connections = 10;
            connect-timeout = 5;
            builders-use-substitutes = true;
            extra-substituters = [
                "https://cache.nixos.org/"
            ];

            trusted-public-keys = [
                "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
            ];
        };
    };

    nixpkgs.config.allowUnfree = true;
    programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
            stdenv.cc.cc
            glibc
            zlib
            zstd
            util-linux
        ];
    };
}
