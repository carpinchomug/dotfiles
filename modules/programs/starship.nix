{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      nix_shell = {
        symbol = "❄️ ";
      };
    };
  };
}
