{ config, pkgs, ... }:

{
  home.packages = [ pkgs.librewolf-wayland ];
}
