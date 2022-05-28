{ config, pkgs, ...}:

{
  imports = [
    ./pijul
    ./direnv.nix
    ./git.nix
    ./languages.nix
    ./latexmkrc.nix
  ];
}
