vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- Compile and run the current C++ file
vim.api.nvim_set_keymap('n', '<F5>', ':w<CR>:!g++ % -o %:r.exe && %:r.exe<CR>', { noremap = true, silent = true })

-- Enable relative line numbers
vim.opt.relativenumber = true
local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"


vim.schedule(function()
  require "mappings"
end)
-- Pyright LSP setup
require('lspconfig').pyright.setup{}

-- Define a custom command that saves the file and runs it with Python
vim.api.nvim_create_user_command('RunPython', function()
  vim.cmd('w!')
  vim.cmd('!python %')
end, {})

-- Map Shift + r to the custom command
vim.api.nvim_set_keymap('n', '<S-r>', ':RunPython<CR>', { noremap = true, silent = true })
-- Add this in your init.lua or custom lua file
local lspconfig = require'lspconfig'

-- Setup clangd for C++
lspconfig.clangd.setup{
    on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        -- Keybindings for LSP
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        -- Add more keymaps as needed
    end,

    flags = {
        debounce_text_changes = 150,
    },
}

local nvim_lsp = require('lspconfig')
nvim_lsp.jdtls.setup{}
local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup({})


vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]


-- Ensure you have 'nvim-lspconfig' installed
require'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

