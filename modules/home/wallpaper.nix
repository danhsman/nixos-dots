{ pkgs, config, ... }:

let
  wallpaperPath = "${config.home.homeDirectory}/nixos-dots/Wallpapers/tplt.png";
in
{
  home.packages = [ pkgs.wpaperd ];

  services.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        path = wallpaperPath;
      };
    };
  };
}
