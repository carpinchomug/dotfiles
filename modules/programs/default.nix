{ config, pkgs, ... }:

{
  imports = [
    ./librewolf
    ./neovim
    ./chromium.nix
    ./firefox.nix
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
    vlc
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
