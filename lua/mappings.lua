require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map("n", "")




-- Remap Caps Lock to Esc
-- vim.api.nvim_set_keymap('i', '<CapsLock>', '<Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<CapsLock>', '<Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<CapsLock>', '<Esc>', { noremap = true, silent = true })
