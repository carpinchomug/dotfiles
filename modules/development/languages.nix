{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Bash
    nodePackages.bash-language-server

    # C/C++
    gcc


    # Haskell
    haskellPackages.ghc
    haskellPackages.cabal-install
    haskellPackages.haskell-language-server


    # HTML/CSS/JSON
    nodePackages.vscode-langservers-extracted


    # JavaScript & TypeScript
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server


    # Latex
    texlive.combined.scheme-full
    bibutils
    texlab


    # Lua
    sumneko-lua-language-server


    # Nix
    rnix-lsp


    # Python
    (python3.withPackages (pythonPackages: with pythonPackages; [
      numpy
      scipy
      matplotlib
      ipython
      python-lsp-server
    ]))


    # Rust
    rustc
    cargo
    clippy
    rustfmt
    rust-analyzer
  ];
}
