{ config, ... }:
{
    security = {
        pam.services.greetd.enableGnomeKeyring = true;
        polkit.enable = true;
        rtkit.enable = true;
        sudo = {
            enable = true;
            extraRules = [{
                users = [ "nora" ];
                commands = [{
                    command = "ALL";
                    options = [ "NOPASSWD" ];
                }];
            }];
        };

        doas = {
            enable = true;
            extraRules = [{
                groups = [ "wheel" ];
                users = [ "nora" ];
                keepEnv = false;
                noPass = true;
            }];
        };
    };
}
