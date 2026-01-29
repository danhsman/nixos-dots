{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fuzzel
    quickshell
    kdePackages.qtdeclarative
    floorp-bin
    capitaine-cursors

    yazi
    tree
    lazygit
    statix
    fastfetch
    ripgrep
    nixpkgs-fmt

    nil
    nodejs
    gcc
    gnumake
    cmake
    gdb
    valgrind
    clang-tools
    cpplint

    python3
    black
    isort
    pylint
    pyright

    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
    pkg-config
    openssl


    nur.repos.Ev357.helium
  ];
}
