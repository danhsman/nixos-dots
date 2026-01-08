{ config, pkgs, inputs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dots/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    quickshell = "quickshell";
    niri = "niri";
  };
  src = "~/nixos-dots/Wallpapers/tplt.png";
in

{
  home.username = "danhs";
  home.homeDirectory = "/home/danhs";
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-dots#nixos";
      del-gen = "sudo nix-collect-garbage -d && sudo nixos-rebuild switch --flake ~/nixos-dots#nixos";
    };
  };
  home.packages = with pkgs; [
    tree
    foot
    fuzzel
    quickshell
    kdePackages.qtdeclarative
    floorp-bin
    lazygit
    statix
    fastfetch
    git
    ripgrep
    nil
    nodejs
    gcc
    capitaine-cursors
    nixpkgs-fmt
  ];

  home.pointerCursor = {
    name = "capitaine-cursors";
    package = pkgs.capitaine-cursors;
    size = 28;

    gtk.enable = true;
    x11.enable = true;
  };

  xdg.configFile = (builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
    })
    configs) // {
    # We merge the new file definition here using '//'
    "direnv/direnv.toml".text = ''
      [global]
      hide_env_diff = true
    '';
  };

  services.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        path = src;
      };
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

}
