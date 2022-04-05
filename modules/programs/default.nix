{ config, pkgs, ... }:

{
  imports = [
    ./firefox
    ./librewolf
    ./neovim
    ./chromium.nix
    ./foot.nix
    ./helix.nix
    ./starship.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    bat
    zip unzip
    ffmpeg
    termite
    obsidian
  ];

  programs.exa = {
    enable = true;
    enableAliases = true;
  };
}
