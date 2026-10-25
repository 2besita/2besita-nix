{ config, pkgs, ... }: {

    boot = {
        kernelPackages = pkgs.linuxPackages_zen;
        kernelModules = [ "uinput" ];
        blacklistedKernelModules = [ 
            "wacom" "hid-uclient" 
            "hid-huion" "hid-xppen" 
        ];

        loader = {
            systemd-boot.enable = false;
            efi.canTouchEfiVariables = true;
            grub = {
                enable = true;
                theme = ./yorha-1920x1080;
                efiSupport = true;
                device = "nodev";
            };
        };

        kernelParams = [ "amdgpu.dcfeaturemask=0x2" ];

    };

    zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 50;
    };
}
