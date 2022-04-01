{ config, lib, pkgs, ... }:

let
  cfg = config.wayland.windowManager.sway.config;
  mod = cfg.modifier;

in
{
  wayland.windowManager.sway = {
    config = {
      keybindings = lib.mkOptionDefault {
        # Default keybindings are commented out

        # essentials
        # "${mod}+Return" = "exec ${cfg.terminal}";
        # "${mod}+d" = "exec ${cfg.menu}";
        "${mod}+b" = "exec firefox";

        # "${mod}+Shift+q" = "kill";

        # "${mod}+Shift+c" = "reload";
        # "${mod}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";


        # layout

        # to be consistent with vim split keybindings
        "${mod}+s" = "splitv";
        "${mod}+v" = "splith";

        "${mod}+t" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        # "${mod}+a}" = "focus parent";


        # audio control
        "XF86AudioMute" = "exec pamixer --toggle";
        "XF86AudioRaiseVolume" = "exec pamixer --increase 5";
        "XF86AudioLowerVolume" = "exec pamixer --decrease 5";
        "XF86AudioMicMute" = "exec pamixer --default-source --toggle";
        # "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";
        # "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'";
        # "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'";
        # "XF86AudioMicMute" = "exec 'pactl set-source-mute @DEFAULT_SOURCE@ toggle'";


        # brightness
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set +5%";


        # screenshot
        "${mod}+Print" = ''
          exec grim \
               ~/Pictures/Screenshots/$(date "+%Y%m%d_%Hh%Mm%Ss_grim.png")
        '';
        "${mod}+Alt+Print" = ''
          exec grim -g "$(slurp)" \
               ~/Pictures/Screenshots/$(date "+%Y%m%d_%Hh%Mm%Ss_grim.png")
        '';
      };
    };
  };
}
