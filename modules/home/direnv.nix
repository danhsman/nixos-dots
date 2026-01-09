{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  xdg.configFile."direnv/direnv.toml".text = ''
    [global]
    hide_env_diff = true
  '';
}
