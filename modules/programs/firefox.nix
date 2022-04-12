{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;

    profiles = {
      default = {
        isDefault = true;

        settings = {
          "browser.shell.checkDefaultBrowser" = false;
        };
      };
    };
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XDG_CURRENT_DESKTOP = "sway";
  };
}
