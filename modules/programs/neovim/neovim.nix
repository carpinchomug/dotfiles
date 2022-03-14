{ config, pkgs, ... }:

# Manual on managing (neo)vim with nixpkgs:
# https://nixos.org/manual/nixpkgs/stable/#managing-plugins-with-vim-packages

let
  # Relavant section in the manual ->
  # 15.32.2.1. What if your favourite Vim plugin isn’t already packaged?

  # About `rev`
  # If `rev` is not available on GitHub, clone the repo and use
  # `git rev-parse HEAD` or run `git rev-list` with appropriate options.

  # About `sha256`
  # Use `nix-prefetch-url --unpack <url>` to get hash. If the source code is
  # available in a GitHub repo, the url will be
  # `https://github.com/User/repo/archive/branch.tar.gz`, for rose-pine, it is
  # `https://github.com/rose-pine/neovim/archive/main.tar.gz`
  # There is another thing to note about the hash. See:
  # https://nixos.org/manual/nixpkgs/stable/#sec-source-hashes
  # There may still be some errors saying "nix hash mismatch in fixed-output
  # derivation". Usually copy-and-pasting the hash that is printed along with
  # the error message fixes the issue. This blog article may be helpful to understand the behaviour better:
  # https://blog.eigenvalue.net/nix-rerunning-fixed-output-derivations/
  rose-pine = pkgs.vimUtils.buildVimPlugin {
    name = "rose-pine-neovim";
    src = pkgs.fetchFromGitHub {
      owner = "rose-pine";
      repo = "neovim";
      rev = "d16fc7333fceed492899d8727e081888dff8a12f";
      sha256 = "1vhybn1qadkskvsk9r3a9zj3ff09pswrw65m6cgxxfqf7h5b1gz4";
    };
  };

  catppuccin = pkgs.vimUtils.buildVimPlugin {
    name = "catppuccin-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "nvim";
      rev = "193676fe0aae7f742198b54c56276f118183cf8a";
      sha256 = "08idw7q32nw3zfs8b4bzaczygxdv9w4d9mkpg76rryx84my1kz71";
    };
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

        comment-nvim

        nvim-autopairs

        fugitive

        plenary-nvim
        telescope-nvim

        lualine-nvim
        nvim-web-devicons

        julia-vim

        rose-pine
        catppuccin

        # Relavant section in the manual ->
        # 15.32.2.2.1. Tree sitter
        (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))
      ];

      extraConfig = ''
        lua << EOF

        -- Global variables
        vim.g.mapleader = ","

        -- vim.g.rose_pine_bold_vertical_split_line = false
        -- vim.g.rose_pine_inactive_background = false
        vim.g.rose_pine_disable_background = true
        vim.g.rose_pine_disable_float_background = true
        vim.g.rose_pine_disable_italics = true


        -- Options
        vim.opt.number = true
        vim.opt.relativenumber = true

        vim.opt.shiftwidth = 4
        vim.opt.expandtab = true
        vim.opt.autoindent = true

        vim.opt.signcolumn = "yes"

        vim.opt.splitbelow = true
        vim.opt.splitright = true

        vim.completeopt = { "menu", "menuone", "noselect" }


        -- Keymappings
        local map = vim.api.nvim_set_keymap

        map("n", "Y", "y$", { noremap = true })

        map("n", "<c-h>", "<c-w>h", { noremap = true })
        map("n", "<c-j>", "<c-w>j", { noremap = true })
        map("n", "<c-k>", "<c-w>k", { noremap = true })
        map("n", "<c-l>", "<c-w>l", { noremap = true })

        map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true })
        map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true })
        map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
        map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })


        -- UI
        vim.cmd "colorscheme rose-pine"
        -- vim.cmd [[
        --   highlight StatusLine ctermbg=NONE guibg=NONE
        --   highlight StatusLineNC ctermbg=NONE guibg=NONE
        -- ]]

        local lualine = require "lualine"
        lualine.setup {
          options = {
            theme = "rose-pine",
            section_separators = "",
            component_separators = ""
          }
        }


        -- Treesitter
        local treesitter_configs = require "nvim-treesitter.configs"
        treesitter_configs.setup {
          highlight = {
            enable = true,
            disable = { "latex", "rust" }  -- broken for latex atm
          },
          indent = {
            enable = false,
          },
        }


        -- Completion
        local cmp = require "cmp"
        cmp.setup {
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          mapping = {
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.close(),
            ["<C-y>"] = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            },
          },
          sources = cmp.config.sources {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
          },
        }


        -- Autopairs
        local autopairs =  require "nvim-autopairs"
        autopairs.setup()


        -- Comment
        local comment = require "Comment"
        comment.setup()


        -- LSP
        local nvim_lsp = require "lspconfig"

        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(client, bufnr)
          local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
          local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

          -- Enable completion triggered by <c-x><c-o>
          buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

          -- Mappings.
          local opts = { noremap=true, silent=true }

          -- See `:help vim.lsp.*` for documentation on any of the below functions
          buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
          buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
          buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
          buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
          -- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
          buf_set_keymap("n", "<space>-k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
          buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
          buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
          buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
          buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
          buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
          buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
          buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
          buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
          buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
          buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
          buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
          buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

        end

        -- Disable floating error messages
        vim.diagnostic.config({virtual_text = false})
        -- Show borders around hover windows
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover, {
            -- Use a sharp border with `FloatBorder` highlights
            border = "single"
          }
        )

        -- Use a loop to conveniently call 'setup' on multiple servers and
        -- map buffer local keybindings when the language server attaches
        local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

        local servers = { "cssls", "hls", "html", "julials", "pylsp", "rnix", "rust_analyzer", "tsserver" }
        for _, lsp in ipairs(servers) do
          nvim_lsp[lsp].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = {
              debounce_text_changes = 150,
            }
          }
        end

        -- I think synctex should be configured here. Most other settings are
        -- configured in latex.nix
        nvim_lsp.texlab.setup {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
            debounce_text_changes = 150,
          },
          settings = {
            texlab = {
              build = {
                args = { "-pdflua", "-interaction=nonstopmode", "-synctex=1", "%f" },
                forwardSearchAfter = true,
                onSave = true
              },
              forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" }
              }
            }
          }
        }

        --  nvim_lsp.texlab.setup {
        --    on_attach = on_attach,
        --    capabilities = capabilities,
        --    flags = {
        --      debounce_text_changes = 150,
        --    },
        --    root_dir = nvim_lsp.util.root_pattern(".latexmkrc"),
        --    settings = {
        --      texlab = {
        --        build = {
        --          forwardSearchAfter = true,
        --          onSave = true
        --        },
        --        forwardSearch = {
        --          executable = "zathura",
        --          args = { "--synctex-forward", "%l:1:%f", "%p" }
        --        }
        --      }
        --    }
        --  }

        EOF
      '';
    };
  }
