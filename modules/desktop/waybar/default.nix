{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      layer = "top";
      position = "top";

      # modules-left = [ "sway/workspaces" "sway/window" ];
      # modules-center = [ "clock" ];
      # modules-right = [ "pulseaudio" "network" "cpu" "memory" "idle_inhibitor" "tray" ];

      # style = ''
      #   builtins.readFile ./style.css
      # '';
    };
  };
}
