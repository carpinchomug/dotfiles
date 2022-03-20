{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "FiraCode Nerd Font";
      size = 14;
    };

    theme = "Rosé Pine";

    # extraConfig = ''
    #   include ${builtins.toString ./rose-pine.conf}
    # '';
  };
}
