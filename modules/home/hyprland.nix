{ lib, pkgs, inputs, ... }: {

  imports = [ inputs.hyprnix.homeManagerModules.default ];

  wayland.windowManager.hyprland = {
    enable = true;
    reloadConfig = true;
    systemd.enable = true;

    config = {

      exec-once = [
        "waybar"
      ];

      general = {
        layout = "master";
        gaps_in = 0;
        gaps_out = 0;
        border_size = 1;
      };

      master = {
        new_status = "master";
        new_on_top = true;
        mfact = 0.55;
      };

      "$mod" = "SUPER";
      bind = [
        "$mod SHIFT, Return, layoutmsg, swapwithmaster"
        "$mod, j, layoutmsg, cyclenext"
        "$mod, k, layoutmsg, cycleprev"
        "$mod, Return, exec, foot" # Replace with your terminal
        "$mod, r, exec, rofi -show drun" # Replace with your terminal
      ];

      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "WLR_NO_HARDWARE_CURSORS,1"
        "NIXOS_OZONE_WL,1"
      ];
    };
  };
}
