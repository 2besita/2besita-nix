{ pkgs, inputs, ... }:
{

    security.pam.services.greetd = { };
    services.seatd.enable = true;
    services.greetd = {
        enable = true;
        useTextGreeter = true;
        settings = {
            default_session = {

                # manual login
                user = "greeter";
                command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd '${inputs.mangowm.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/mango'";
            };
        };
    };
}
