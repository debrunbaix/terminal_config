return {
    'stevearc/oil.nvim', -- git clone du repo 
    dependencies = { { "echasnovski/mini.icons", opts = {} } }, -- chargement des dépendances.
    config = function()
        require("oil").setup({
	    view_options = {
		show_hidden = true, -- affichage des fichiers caché.
	    },
	})

        vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>") -- mise en place du raccourcis clavier
    end
}
