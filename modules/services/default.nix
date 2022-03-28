{ config, pkgs, ... }:

{
  imports = [ ./fcitx5.nix ];

  services.gnome-keyring.enable = true;
  services.udiskie.enable = true;

  # Note, for the applet to work, the 'blueman' service should be enabled system-wide.
  services.blueman-applet.enable = true;
}
