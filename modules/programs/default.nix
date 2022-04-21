{ config, pkgs, ... }:

{
  imports = [
    ./librewolf
    ./helix
    ./neovim
    ./chromium.nix
    ./firefox.nix
    ./foot.nix
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
    gimp
    libreoffice
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
