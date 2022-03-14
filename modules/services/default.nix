{ config, pkgs, ... }:

{
  services.gnome-keyring.enable = true;
  services.udiskie.enable = true;
}
