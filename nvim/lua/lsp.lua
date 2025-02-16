-- ===================================================================
--  Language Server Protocol (LSP) Configuration for Neovim
--  Author: 0x2brunbaix
--  Description: This file sets up LSP servers for Python (Pyright)
--  and C/C++ (Clangd). It also configures key mappings for LSP-related
--  features such as go-to definition, references, and renaming.
-- ===================================================================

-- Load LSP configuration module
local lspconfig = require("lspconfig")

-- ===================================================================
--  LSP Server Setup
-- ===================================================================

-- Configure LSP for Python using Pyright
lspconfig.pyright.setup({})

-- Configure LSP for C and C++ using Clangd
lspconfig.clangd.setup({})

-- Enable additional LSP capabilities (used for completion integration with nvim-cmp)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Reapply LSP setup with enhanced capabilities
lspconfig.pyright.setup({
    capabilities = capabilities
})

lspconfig.clangd.setup({
    capabilities = capabilities
})

-- ===================================================================
--  LSP Keybindings
-- ===================================================================

-- Function to set keybindings for LSP functions
local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local bufmap = vim.api.nvim_buf_set_keymap

    -- Go to definition
    bufmap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

    -- Find references
    bufmap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    -- Show diagnostic messages
    bufmap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

    -- Rename symbol
    bufmap(bufnr, "n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

    -- Format the current buffer
    bufmap(bufnr, "n", "<Leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
end

-- ===================================================================
--  Automatically Apply Keybindings When LSP Attaches to a Buffer
-- ===================================================================

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        lsp_keymaps(event.buf)
    end,
})

-- ===================================================================
--  End of LSP Configuration
-- ===================================================================

