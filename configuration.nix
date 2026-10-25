{ inputs }:

let
    lib = inputs.nixpkgs.lib;
    recursivelyImport = import ./import.nix { inherit lib; };

    specialArgs = {
        inherit inputs;
        baseVars.username = "nora";
    };
in

{
    tichelmorres = lib.nixosSystem {
        specialArgs = specialArgs // {
            hostVars = {
                hostname = "tichelmorres";
                stateVersion = "26.11";
            };
        };

        modules = recursivelyImport [
            ./base
            ./sys
            ./hosts/tichelmorres
        ] ++ [
            { system.stateVersion = "26.11"; }
        ];
    };
}
