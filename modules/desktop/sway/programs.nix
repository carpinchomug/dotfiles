{ config, pkgs, lib, ... }:

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

  wayland.windowManager.sway.extraSessionCommands = ''
    if [[ ! -d ~/Pictures/Screenshots ]]; then
      mkdir -p ~/Pictures/Screenshots
    fi
  '';
}
