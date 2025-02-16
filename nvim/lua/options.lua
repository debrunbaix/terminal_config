-- ===================================================================
--  Neovim Basic Settings and Options
--  Author: 0x2brunbaix
--  Description: This file configures basic Neovim settings such as
--  line numbers, indentation, syntax highlighting, and leader key.
-- ===================================================================

-- ===================================================================
--  Line Numbering
-- ===================================================================

vim.o.number = true  -- Enable absolute line numbering
vim.o.relativenumber = true  -- Enable relative line numbering

-- ===================================================================
--  Indentation and Tab Settings
-- ===================================================================

vim.o.tabstop = 4  -- Number of spaces a tab represents
vim.o.shiftwidth = 4  -- Number of spaces for each indentation level
vim.o.expandtab = true  -- Convert tabs to spaces

-- ===================================================================
--  Syntax Highlighting and Colors
-- ===================================================================

vim.cmd("syntax on")  -- Enable syntax highlighting
vim.cmd("set termguicolors")  -- Enable true color support for better themes

-- ===================================================================
--  Leader Key Configuration
-- ===================================================================

vim.g.mapleader = " "  -- Set space as the leader key
vim.g.maplocalleader = " "  -- Set space as the local leader key

-- ===================================================================
--  End of Options Configuration
-- ===================================================================

