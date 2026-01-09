{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fuzzel
    quickshell
    kdePackages.qtdeclarative
    floorp-bin
    capitaine-cursors

    tree
    lazygit
    statix
    fastfetch
    ripgrep
    nixpkgs-fmt

    nil
    nodejs
    gcc
  ];
}
