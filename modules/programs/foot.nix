{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "FiraCode Nerd Font:size=13";
        dpi-aware = "no";
      };

      # revert to default:
      #   color: inversed foreground and background
      #   blink: no
      # cursor = {
      #   color = "e0def4 555169";
      #   blink = "Yes";
      # };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        alpha = 0.9;

        foreground = "e0def4";
        background = "191724";

        # black
        regular0 = "26233a";
        bright0  = "6e6a86";

        # red
        regular1 = "eb6f92";
        bright1  = "eb6f92";

        # green
        regular2 = "31748f";
        bright2  = "31748f";

        # yellow
        regular3 = "f6c177";
        bright3  = "f6c177";

        # blue
        regular4 = "9ccfd8";
        bright4  = "9ccfd8";

        # magenta
        regular5 = "c4a7e7";
        bright5  = "c4a7e7";

        # cyan
        regular6 = "ebbcba";
        bright6  = "ebbcba";

        # white
        regular7 = "e0def4";
        bright7  = "e0def4";

        urls = "c4a7e7";
      };
    };
  };
}
