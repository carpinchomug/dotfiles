{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      # lsp
      nvim-lspconfig

      # autocomplete
      nvim-cmp
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-buffer
      cmp-path

      luasnip
      cmp_luasnip
      friendly-snippets

      # utilities
      comment-nvim
      nvim-autopairs
      lazygit-nvim

      # ui stuff
      rose-pine

      plenary-nvim
      telescope-nvim

      (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))

    ];

    extraConfig = ''
      lua << EOF
      ${builtins.readFile ./config.lua}
      EOF
    '';
  };
}
