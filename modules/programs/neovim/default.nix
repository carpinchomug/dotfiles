{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig

      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-buffer
      cmp-path

      luasnip
      cmp_luasnip

      comment-nvim

      nvim-autopairs

      fugitive

      plenary-nvim
      telescope-nvim

      nightfox-nvim

      (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))
    ];

    extraPackages = with pkgs; [
      haskell-language-server
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      rnix-lsp
      rust-analyzer
      sumneko-lua-language-server
      texlab
    ];

    extraConfig = ''
      lua << EOF
      ${builtins.readFile ./config.lua}
      EOF
    '';
  };
}
