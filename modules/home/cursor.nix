{ pkgs, ... }:
{
  home.pointerCursor = {
    name = "macOS";
    package = pkgs.apple-cursor;
    size = 16;
    gtk.enable = true;
  };
}
