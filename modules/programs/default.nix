{ config, pkgs, ... }:

{
  imports = [
    ./firefox
    ./neovim
    ./alacritty.nix
    ./chromium.nix
    ./starship.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    bat
    zip unzip
    termite
  ];

  programs.exa = {
    enable = true;
    enableAliases = true;
  };
}
