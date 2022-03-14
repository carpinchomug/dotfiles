{ config, pkgs, ... }:

{
  imports = [
    ./config.nix
    ./keybindings.nix
    ./programs.nix
  ];
}
