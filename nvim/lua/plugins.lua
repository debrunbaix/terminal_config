-- ===================================================================
--  Plugin Management with Lazy.nvim
--  Author: 0x2brunbaix
--  Description: This file manages Neovim plugins using Lazy.nvim.
--  It includes plugins for UI enhancements, LSP support, auto-completion,
--  file navigation, and more.
-- ===================================================================

-- ===================================================================
--  Install Lazy.nvim if not already installed
-- ===================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ===================================================================
--  Load and Configure Plugins
-- ===================================================================
require("lazy").setup({

    -- ===================================================================
    --  Essential Plugins
    -- ===================================================================

    -- Fuzzy Finder (Telescope) - Enables searching for files, buffers, etc.
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- Syntax Highlighting and Code Parsing (Treesitter)
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Language Server Protocol (LSP) Configuration
    { "neovim/nvim-lspconfig" },

    -- Theme: Doki Theme (Nakano Nino)
    { "doki-theme/doki-theme-vim" },

    -- ===================================================================
    --  Auto-Completion and Snippets
    -- ===================================================================

    { "hrsh7th/nvim-cmp", -- Auto-completion engine
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",  -- LSP-based completion
            "hrsh7th/cmp-buffer",    -- Buffer word completion
            "hrsh7th/cmp-path",      -- File path completion
            "hrsh7th/cmp-cmdline",   -- Command-line completion
            "L3MON4D3/LuaSnip",      -- Snippet management
            "saadparwaiz1/cmp_luasnip" -- Snippet completion integration
        }
    },

    -- Auto Pairs (Automatically closes brackets, quotes, etc.)
    { "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },

    -- ===================================================================
    --  File Navigation and UI Enhancements
    -- ===================================================================

    -- Oil.nvim (File Explorer)
    { "stevearc/oil.nvim",
        config = function()
            require("oil").setup({
                default_file_explorer = true, -- Replaces netrw
                columns = { "icon" }, -- Show file icons
                keymaps = {
                    ["<CR>"] = "actions.select", -- Open file/directory
                    ["-"] = "actions.parent", -- Move up a directory
                    ["q"] = "actions.close", -- Close Oil
                    ["<C-r>"] = "actions.refresh", -- Refresh view
                    ["H"] = "actions.toggle_hidden", -- Show/hide hidden files
                },
                view_options = {
                    show_hidden = true, -- Show hidden files (e.g., .gitignore, .env)
                },
            })
        end
    },

    -- Alpha.nvim (Custom Neovim Dashboard)
    { "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Icons support
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end
    }

})

