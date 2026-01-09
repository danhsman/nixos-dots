{ inputs, pkgs, config, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./wallpaper.nix
    ./packages.nix
    ./niri.nix
    ./quickshell.nix
    ./bash.nix
    ./direnv.nix
    ./nixvim.nix
    ./git.nix
    ./foot.nix
  ];

  home.stateVersion = "25.11";
}
