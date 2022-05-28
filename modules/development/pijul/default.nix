{ pkgs, ... }:

{
  home.packages = [ pkgs.pijul ];
  xdg.configFile.pijul = {
    source = ./config.toml;
    target = "pijul/config.toml";
  };
}
