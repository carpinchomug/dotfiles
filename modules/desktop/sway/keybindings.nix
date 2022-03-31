{ config, lib, pkgs, ... }:

let
  cfg = config.wayland.windowManager.sway.config;

in
{
  wayland.windowManager.sway = {
    config = {
      keybindings = lib.mkOptionDefault {
        "${cfg.modifier}+b" = "exec librewolf";

        "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";
        "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'";
        "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'";
        "XF86AudioMicMute" = "exec 'pactl set-source-mute @DEFAULT_SOURCE@ toggle'";

        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set +5%";

        "${cfg.modifier}+Print" = ''
          exec grim \
               ~/Pictures/Screenshots/$(date "+%Y%m%d_%Hh%Mm%Ss_grim.png")
        '';
        "${cfg.modifier}+Alt+Print" = ''
          exec grim -g "$(slurp)" \
               ~/Pictures/Screenshots/$(date "+%Y%m%d_%Hh%Mm%Ss_grim.png")
        '';
      };
    };
  };
}
