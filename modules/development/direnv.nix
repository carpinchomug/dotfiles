{ config, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;

      # programs.direnve.nix-direnv.enableFlakes no longer has any effect; please remove it.
      # Flake support is now always enable.
      # enableFlakes = true;
    };
  };
}
