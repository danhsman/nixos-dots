{ pkgs, ... }:
{
  home.pointerCursor = {
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 21;
    gtk.enable = true;
  };
}
