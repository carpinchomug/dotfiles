{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    font = {
      package = pkgs.noto-fonts;
      name = "Noto Sans";
      size = 10;
    };

    iconTheme = {
      package = pkgs.zafiro-icons;
      name = "Zafiro-icons";
    };

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "Rose-Pine";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
