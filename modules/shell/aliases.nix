{ config, pkgs, ... }:

{
  home.shellAliases = {
    nixos-switch = "nixos-rebuild switch --use-remote-sudo --flake ~/.config/nixos#thinkpad";
    hm-switch = "home-manager switch --flake ~/.config/nixpkgs#akiyoshi";
    quickpy = "nix flake init --template github:carpinchomug/flake-templates#quickpython";
  };
}
