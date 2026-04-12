{ pkgs, ... }:
{
  services.displayManager.ly.enable = true;
  programs.niri.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.dwl = {
    enable = true;
    package = pkgs.dwl.override {
      configH = builtins.readFile ./dwl/config.h;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = [ "gnome" ];
  };
}
