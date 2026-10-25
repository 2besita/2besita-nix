{
    description = "nora's own synaptic pattern nix configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        curd = {
            url = "github:Wraient/curd/v2.0.9";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        helium = {
            url = "github:oxcl/nix-flake-helium-browser";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        flec = {
            url = "github:tichelmorres/flec";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        yum = {
            url = "github:ochitsudayo/yum";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nock = {
            url = "github:ochitsudayo/nock";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        mangowm = {
            url = "github:mangowm/mango";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        { self, home-manager, nixpkgs, curd, helium, flec, yum, nock, mangowm, ... }
        @inputs:
        let
            lib = nixpkgs.lib;
            supportedSystems = [ "x86_64-linux" ];

            forAllSystems = apply:
                lib.genAttrs supportedSystems
                    (system: apply nixpkgs.legacyPackages.${system});
        in

        {
            packages = forAllSystems (pkgs: {
                default = pkgs.git;
            });

            devShells = forAllSystems (pkgs: {
                default = pkgs.mkShellNoCC {
                    packages = [ pkgs.git ];
                };
            });

            nixosConfigurations = import ./configuration.nix { inherit inputs; };
        };
}
