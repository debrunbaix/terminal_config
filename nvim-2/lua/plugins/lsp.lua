
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
        config = function()
            local lspconfig = require("lspconfig")

            -- Configuration de Pyright (LSP pour Python)
            lspconfig.pyright.setup {
                capabilities = require("cmp_nvim_lsp").default_capabilities()
            }

	    -- Configuration de Clangd pour C/C++
            lspconfig.clangd.setup {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                cmd = { "clangd", "--background-index" }, -- Optionnel : active l'indexation en arrière-plan
            }

            -- Configuration de nvim-cmp (auto-complétion)
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(), -- Afficher les suggestions
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmer la complétion
                    ["<Tab>"] = cmp.mapping.select_next_item(), -- Naviguer entre les suggestions
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- Complétion depuis LSP
                    { name = "luasnip" }, -- Complétion avec snippets
                    { name = "buffer" }, -- Complétion avec le texte du buffer
                    { name = "path" }, -- Complétion des fichiers
                })
            })
        end,
    }
}

