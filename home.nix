{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dots/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    niri = "niri";
  };
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
    foot
    firefox
    lazygit
    fastfetch
    git
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    fuzzel
  ];

  xdg.configFile = builtins.mapAttrs 
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
   })
   configs;

}
