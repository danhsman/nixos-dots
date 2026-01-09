{ pkgs, config, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core/bootloader.nix
    ../../modules/core/nvidia.nix
    ../../modules/core/pipewire.nix
    ../../modules/core/program.nix
    ../../modules/core/system.nix
    ../../modules/core/user.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "nixos";

  boot.supportedFilesystems = [ "ntfs" ];
  fileSystems."/home/danhs/Drives/Windows" = {
    device = "/dev/nvme0n1p3";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.danhs = {
      imports = [ ../../modules/home/default.nix ];
    };
  };
}
