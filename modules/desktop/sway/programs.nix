{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    glib
    grim
    gsettings-desktop-schemas
    imv
    mako
    pulseaudio
    slurp
    swaylock
    swayidle
    wofi
    wl-clipboard
  ];
}
