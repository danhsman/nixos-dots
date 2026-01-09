{ pkgs, ... }:

{
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Athens";
  time.hardwareClockInLocalTime = true;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "el_GR.UTF-8";
    LC_IDENTIFICATION = "el_GR.UTF-8";
    LC_MEASUREMENT = "el_GR.UTF-8";
    LC_MONETARY = "el_GR.UTF-8";
    LC_NAME = "el_GR.UTF-8";
    LC_NUMERIC = "el_GR.UTF-8";
    LC_PAPER = "el_GR.UTF-8";
    LC_TELEPHONE = "el_GR.UTF-8";
    LC_TIME = "el_GR.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us,gr";
    variant = "";
    options = "grp:alt_shift_toggle";
  };
  console.useXkbConfig = true;

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}
