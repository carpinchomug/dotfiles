{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 32;

        modules-left = [ "sway/workspaces" "sway/window" ];
        modules-center = [ "clock" ];
        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "backlight"
          "battery"
          "tray"
        ];

        clock = {
          format = "{:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt>{calendar}</tt>";
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = "";
          format-bluetooth = "{volume}% {icon}";
          format-bluetooth-muted = "";
          format-icons = {
            headphone = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        network = {
          format = "{ifname}";
          format-wifi = "{signalStrength}% ";
          format-ethernet = "{ipaddr}/{cidr} ";
          format-disconnected = ""; # An empty format will hide the module
          tooltip-format = "{ifname} via {gwaddr} ";
          tooltip-format-wifi = "{essid}";
        };

        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };

        memory = {
          format = "{percentage}% ";
          tooltip = false;
        };

        backlight = {
          format = "{percent}% {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        battery = {
          states = {
            critical = 20;
            warning = 30;
          };
          format = "{capacity}% {icon}";
          format-critical = "{capacity}% <span color='#eb6f92'>{icon}</span>";
          format-warning = "{capacity}% <span color='#f6c177'>{icon}</span>";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";

          format-icons = [ "" "" "" "" "" ];
        };

        tray = {
          spacing = 10;
        };
      }
    ];

    style = ''
      ${builtins.readFile ./style.css}
    '';
  };
}
