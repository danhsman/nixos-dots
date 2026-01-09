{ pkgs, ... }:
{
  services.displayManager.ly.enable = true;
  programs.niri.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = [ "gnome" ];
  };
}
