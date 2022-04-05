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
    bottom
    zip unzip
    ffmpeg
    termite
    obsidian
  ];

  programs.bat = {
    enable = true;

    config = {
      theme = "base16";
    };
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };
}
