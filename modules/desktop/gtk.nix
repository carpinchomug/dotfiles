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
      package = pkgs.pop-icon-theme;
      name = "Papirus";
    };

    theme = {
      package = pkgs.pop-gtk-theme;
      name = "Pop";
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
