{ pkgs, ... }:
{
  home.pointerCursor = {
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 14;
    gtk.enable = true;
  };
}
