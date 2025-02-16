-- ===================================================================
--  Neovim Configuration
--  Author: 0x2brunbaix
--  Description: Main configuration file that loads all modular settings.
-- ===================================================================

-- Load basic editor options (line numbers, indentation, colors, etc.)
require("options")

-- Load plugin manager and installed plugins
require("plugins")

-- Load theme and color scheme settings
require("theme")

-- Load custom key mappings
require("keymaps")

-- Load Language Server Protocol (LSP) configurations for Python, C, etc.
require("lsp")

-- Load auto-completion setup (nvim-cmp, snippets, etc.)
require("completion")

-- Load custom dashboard for the startup screen
require("dashboard")

-- ===================================================================
--  End of configuration
-- ===================================================================

