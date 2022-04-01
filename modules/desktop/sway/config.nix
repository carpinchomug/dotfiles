{ config, lib, pkgs, ... }:

let
  wallpaper = builtins.toString (../wallpapers + "/serenity.png");

in
{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures = {
      gtk = true;
    };

    config = {
      modifier = "Mod4";
      terminal = "kitty";
      menu = "wofi --show run | xargs swaymsg exec --";
      bars = [ { command = "waybar"; } ];

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

      fonts = {
        names = [ "Noto Sans" "Noto Sans CJK JP" "NotoSans Nerd Font" ];
        size = 10.0;
      };

      gaps = {
        inner = 10;
      };

      window = {
        border = 2;
      };

      colors = {
        focused = {
          border = "#31748f";
          background = "#524f67";
          text = "#e0def4";
          indicator = "#9ccfd8";
          childBorder = "#31748f";
        };
        focusedInactive = {
          border = "#31748f";
          background = "#403d52";
          text = "#e0def4";
          indicator = "#524f67";
          childBorder = "#21202e";
        };
        unfocused = {
          border = "#31748f";
          background = "#191724";
          text = "#6e6a86";
          indicator = "#524f67";
          childBorder = "#21202e";
        };
        urgent = {
          border = "#31748f";
          background = "#26233a";
          text = "#e0def4";
          indicator = "#ebbcba";
          childBorder = "#eb6f92";
        };
      };

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
