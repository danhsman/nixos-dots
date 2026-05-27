{ inputs, pkgs, config, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./hyprland.nix
    ./waybar.nix
    ./cursor.nix
    ./wallpaper.nix
    ./packages.nix
    ./quickshell.nix
    ./bash.nix
    ./direnv.nix
    ./nixvim.nix
    ./git.nix
    ./foot.nix
  ];

  home.stateVersion = "25.11";
}
