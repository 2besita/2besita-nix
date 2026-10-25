{ config, ... }:
{
    networking = {
        hostName = "tichelmorres";
        networkmanager.enable = true;
        enableIPv6 = true;
        firewall = {
            enable = true;
            trustedInterfaces = [ config.services.tailscale.interfaceName ];
            allowedTCPPorts = [ 8000 80 10050 161 6607 59100 59200 59799 5174 ];
            allowedUDPPorts = [ 161 59100 59200 59799 config.services.tailscale.port ];

            allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
            allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
            checkReversePath = false;
        };
    };
}
