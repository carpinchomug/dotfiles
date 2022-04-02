vim.g.mapleader = ","

-- Options
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
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
local rosepine = require "rose-pine"
rosepine.setup {
  disable_background = true,
  disable_float_background = true,
}
vim.cmd "colorscheme rose-pine"


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


-- Snippets
local luasnip_vscode = require "luasnip.loaders.from_vscode"
luasnip_vscode.lazy_load()


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
capabilities.textDocument.completion.completionItem.snippetSupport = true;

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

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  diagnostics = {
    globals = { "vim" }
  }
}

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

vim.lsp.set_log_level("debug")
