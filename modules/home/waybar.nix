{ lib, pkgs, inputs, ... }:
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 22; # Classic dwm height

        # The dwm layout
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "network" "pulseaudio" "clock" ];

        "hyprland/workspaces" = {
          format = "{id}";
          on-click = "activate";
          disable-scroll = true;
          all-outputs = true;
        };
      };
    };

    # The exact dwm CSS theme
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: monospace; /* Or whatever your terminal font is */
        font-size: 14px;
        min-height: 0;
      }

      window#waybar {
        background: #222222;
        color: #eeeeee;
      }

      #workspaces button {
        padding: 0 10px;
        color: #bbbbbb;
        background: transparent;
        box-shadow: inset 0 -3px transparent;
      }

      #workspaces button:hover {
        background: #333333;
      }

      /* The classic dwm blue selection color */
      #workspaces button.active {
        color: #eeeeee;
        background: #005577; 
      }

      #window {
        color: #eeeeee;
      }

      #clock, #pulseaudio, #network {
        padding: 0 10px;
        color: #eeeeee;
      }
    '';
  };
}
