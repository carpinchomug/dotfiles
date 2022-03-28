{ config, pkgs, ... }:

{
  imports = [
    ./sway
    ./waybar
    ./fonts.nix
    ./gtk.nix
  ];
}
