{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
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
