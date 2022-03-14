{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    profileExtra = ''
      export EDITOR=nvim

      # Start sway
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec sway
      fi
    '';
  };

  home.shellAliases = {
    nixos-switch = "sudo nixos-rebuild switch --flake ~/.config/nixos#thinkpad";
    hm-switch = "home-manager switch --flake ~/.config/nixpkgs#akiyoshi";
  };
}
