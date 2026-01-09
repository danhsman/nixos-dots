{ config, pkgs, ... }:

{
  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nixos-dots/config/niri/config.kdl";
}
