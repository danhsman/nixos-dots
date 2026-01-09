{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "danhsman";
        email = "iordageorgiadis@proton.me";
      };
      
      init = {
        defaultBranch = "main";
      };
    };
  };
}
