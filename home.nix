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
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-dots#legion5";
      del-gen = "sudo nix-collect-garbage -d && sudo nixos-rebuild switch --flake ~/nixos-dots#nixos";
    };

    initExtra = ''
      export LS_COLORS="$LS_COLORS:ow=01;34:"
      # Rust DevShell
      mk-rust() {
        if [ -z "$1" ]; then echo "Usage: mk-rust <project-name>"; return 1; fi
        mkdir -p "$1" && cd "$1"
        nix flake init -t ~/nixos-dots#rust
        direnv allow
        nix develop --command cargo init --vcs git
        echo "Rust project '$1' is ready!"
      }

      # C DevShell
      mk-c() {
        if [ -z "$1" ]; then echo "Usage: mk-c <project-name>"; return 1; fi
        mkdir -p "$1" && cd "$1"
        nix flake init -t ~/nixos-dots#c
        direnv allow
        git init
        echo "C project '$1' is ready!"
      }

      # Python DevShell
      mk-py() {
        if [ -z "$1" ]; then echo "Usage: mk-py <project-name>"; return 1; fi
        mkdir -p "$1" && cd "$1"
        nix flake init -t ~/nixos-dots#python
        direnv allow
        git init
        echo "Python project '$1' is ready!"
      }
    '';
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
