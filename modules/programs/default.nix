{ config, pkgs, ... }:

{
  imports = [
    ./firefox
    ./librewolf
    ./neovim
    ./alacritty.nix
    ./chromium.nix
    ./kitty.nix
    ./helix.nix
    ./starship.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    bat
    zip unzip
    termite
    obsidian
  ];

  programs.exa = {
    enable = true;
    enableAliases = true;
  };
}
