{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        size = 12;
        # normal.family = "FiraCode Nerd Font Mono";
        # bold.family = "FiraCode Nerd Font Mono";
        # italic.family = "FiraCode Nerd Font Mono";
        # bold_italic.family = "FiraCode Nerd Font Mono";
        normal.family = "FiraCode Nerd Font";
        bold.family = "FiraCode Nerd Font";
        italic.family = "FiraCode Nerd Font";
        bold_italic.family = "FiraCode Nerd Font";
      };
    };
  };
}
