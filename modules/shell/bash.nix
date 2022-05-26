{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    profileExtra = ''
      export EDITOR=hx

      # Start sway
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec sway
      fi
    '';

    bashrcExtra = ''
      eval $(thefuck --alias)
    '';
  };
}
