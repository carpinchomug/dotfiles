{ config, lib, pkgs, ... }:

let
  wallpaper = builtins.toString (../wallpapers + "/wallpaper.png");

in
{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures = {
      gtk = true;
    };

    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "wofi --show run | xargs swaymsg exec --";
      bars = [
        { command = "waybar"; }
      ];

      input = {
        "type:keyboard" = {
          xkb_layout = "us";
          xkb_options = "ctrl:swapcaps";
        };

        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
          scroll_factor = "0.7";
        };
      };

      output.eDP-1 = { bg = "${wallpaper} fill"; };

      startup = [
        {
          command = ''
            swayidle -w \
            timeout 300 'swaylock -f -c 000000' \
            timeout 600 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
            before-sleep 'swaylock -f -c 000000'
          '';
        }

        {
          command = ''
            systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK
          '';
        }

        {
          command = ''
            hash dbus-update-activation-environment 2>/dev/null && \
            dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK
          '';
        }
      ];
    };
  };
}
