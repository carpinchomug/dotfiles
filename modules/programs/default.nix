{ config, pkgs, ... }:

{
  imports = [
    ./helix
    ./neovim
    ./chromium.nix
    ./firefox.nix
    ./foot.nix
    ./starship.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    alacritty    

    # terminal apps
    ripgrep
    bottom
    zip unzip
    ffmpeg
    efibootmgr
    amfora

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
