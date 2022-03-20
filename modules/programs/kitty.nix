{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };

    theme = "Rosé Pine";

    settings = {
      # can't be directly set with a float value
      background_opacity = "0.9";
    };
  };
}
