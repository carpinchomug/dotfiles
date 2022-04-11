{ config, pkgs, rose-pine-neovim, ... }:

let
  rose-pine-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "rose-pine-nvim";
    src = rose-pine-neovim;
  };

in
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
      friendly-snippets

      comment-nvim

      nvim-autopairs

      lazygit-nvim

      colorizer-lua

      plenary-nvim
      telescope-nvim

      nightfox-nvim

      (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))

      onedark-nvim
      rose-pine-nvim
    ];

    extraConfig = ''
      lua << EOF
      ${builtins.readFile ./config.lua}
      EOF
    '';
  };
}
