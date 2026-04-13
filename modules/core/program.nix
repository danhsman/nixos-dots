{ pkgs, ... }:
{
  services.displayManager.ly.enable = true;
  programs.niri.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.dwl = {
    enable = true;
    package = (pkgs.dwl.override {
      configH = builtins.readFile ./dwl/config.h;
    }).overrideAttrs (oldAttrs: {
      src = pkgs.fetchgit {
        url = "https://codeberg.org/dwl/dwl";
        rev = "v0.7";
        hash = "sha256-7SoCITrbMrlfL4Z4hVyPpjB9RrrjLXHP9C5t1DVXBBA=";
      };
      buildInputs = oldAttrs.buildInputs ++ [ pkgs.fcft pkgs.pixman pkgs.libdrm ];
      patches = [ ./dwl/patches/bar.patch ];
    });
    extraSessionCommands = ''
      export XCURSOR_THEME=macOS
      export XCURSOR_SIZE=14
      export CHROMIUM_FLAGS="--ozone-platform=wayland --enable-features=WaylandWindowDecorations"
      export OZONE_PLATFORM=wayland
    '';
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = [ "gnome" ];
  };
}
