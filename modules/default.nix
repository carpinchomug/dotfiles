{ config, pkgs, ... }:

{
  imports = [
    ./desktop
    ./development
    ./programs
    ./services
    ./shell
  ];
}
