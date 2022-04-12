{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;

    profiles = {
      default = {
        isDefault = true;

        userChrome = "${builtins.readFile ./chrome/userChrome.css}";
        userContent = "${builtins.readFile ./chrome/userContent.css}";

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
