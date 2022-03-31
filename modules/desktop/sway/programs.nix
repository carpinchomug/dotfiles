{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    glib
    grim
    gsettings-desktop-schemas
    imv
    mako
    slurp
    swaylock
    swayidle
    wofi
    wl-clipboard

    # audio stuff
    pulseaudio
    pavucontrol
    pamixer
  ];
}
