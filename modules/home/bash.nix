{ pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-dots#legion5";
      del-gen = "sudo nix-collect-garbage -d && sudo nixos-rebuild switch --flake ~/nixos-dots#legion5";
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
}

