{ pkgs, ... }: {


    fileSystems."/home/nora/2besita" = {
        device = "/dev/disk/by-uuid/e0022dae-094e-44f4-be14-64a20e124e2b";
        fsType = "ext4";
        options = [ "defaults" "nofail" "noatime" "commit=60" ];
    };

    hardware = {
        opentabletdriver.enable = true;
        uinput.enable = true;
        i2c.enable = true;
        enableAllFirmware = true;
        enableRedistributableFirmware = true;
        amdgpu.overdrive.enable = true;
        graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
                libva
                libva-vdpau-driver
                libvdpau-va-gl
            ];
        };
    };
}
