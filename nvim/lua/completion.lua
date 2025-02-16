-- ===================================================================
--  Auto-Completion Configuration for Neovim
--  Author: 0x2brunbaix
--  Description: This file sets up nvim-cmp for auto-completion,
--  integrates snippet support, and enables automatic pairing of
--  brackets, quotes, and other symbols.
-- ===================================================================

-- Attempt to load nvim-cmp safely
local status_cmp, cmp = pcall(require, "cmp")
if not status_cmp then
  print("Error: Failed to load nvim-cmp")
  return
end

-- Attempt to load LuaSnip safely (for snippet expansion)
local status_luasnip, luasnip = pcall(require, "luasnip")
if not status_luasnip then
  print("Error: Failed to load LuaSnip")
  return
end

-- Setup nvim-cmp
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- Enable snippet expansion
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion manually
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item() -- Navigate forward in completion menu
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump() -- Expand snippet if possible
            else
                fallback() -- Default fallback behavior
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item() -- Navigate backward in completion menu
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1) -- Jump backward in snippet placeholders
            else
                fallback() -- Default fallback behavior
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP-based completion
        { name = "luasnip" }, -- Snippet completion
        { name = "buffer" },  -- Suggest words from the current buffer
        { name = "path" },    -- File path completion
    }),
})

-- ===================================================================
--  Auto-Pairing Configuration (nvim-autopairs)
--  Automatically closes brackets, quotes, and other paired symbols.
-- ===================================================================

local autopairs = require("nvim-autopairs")

autopairs.setup({
    disable_filetype = { "TelescopePrompt" }, -- Disable auto-pairs in Telescope
    check_ts = true, -- Enable Treesitter integration for smarter pairing
})

-- Integrate nvim-autopairs with nvim-cmp
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done()) -- Automatically insert closing pairs after completion

-- ===================================================================
--  End of Completion Configuration
-- ===================================================================

