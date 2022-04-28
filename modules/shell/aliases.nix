{ config, pkgs, ... }:

{
  home.shellAliases = {
    nixos-switch = "sudo nixos-rebuild switch --flake ~/.config/nixos#thinkpad";
    hm-switch = "home-manager switch --flake ~/.config/nixpkgs#akiyoshi";
    quickpy = "nix flake init --template github:carpinchomug/flake-templates#quickpython";
  };
}
