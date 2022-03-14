{ config, pkgs, ... }:

{ 
  programs.git = {
    enable = true;
    userName = "Akiyoshi Suda";
    userEmail = "aki.suda@protonmail.com";
  };
}
