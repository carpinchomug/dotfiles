{ config, pkgs, ...}:

{
  imports = [
    ./direnv.nix
    ./git.nix
    ./languages.nix
  ];
}
