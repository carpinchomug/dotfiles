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
    # terminal apps
    ripgrep
    bottom
    zip unzip
    ffmpeg

    # gui apps
    vlc
    gimp
    libreoffice
    inkscape
    blender
  ];

  programs.bat = {
    enable = true;
    config = { theme = "base16"; };
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };
}
