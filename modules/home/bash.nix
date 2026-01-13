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
    '';
  };
}

