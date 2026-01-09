{ pkgs, ... }:

{
  users.users.danhs = {
    isNormalUser = true;
    description = "danhs";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  nixpkgs.config.allowUnfree = true;
}
