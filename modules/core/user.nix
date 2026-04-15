{ ... }:

{
  users.users.danhs = {
    isNormalUser = true;
    description = "danhs";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;
}
