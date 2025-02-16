-- ===================================================================
--  Key Mappings Configuration for Neovim
--  Author: 0x2brunbaix
--  Description: This file defines custom key mappings to improve
--  workflow efficiency by adding shortcuts for frequently used actions.
-- ===================================================================

local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- ===================================================================
--  Custom Keybindings
-- ===================================================================

-- Open Telescope to find files using <Leader>e (Space + e)
map("n", "<Leader>e", ":Telescope find_files<CR>", opts)

-- Open Oil.nvim (file explorer) using <Leader>o (Space + o)
map("n", "<Leader>o", ":Oil<CR>", opts)

-- ===================================================================
--  End of Key Mappings
-- ===================================================================
