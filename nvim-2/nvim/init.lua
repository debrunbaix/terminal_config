require("config.lazy") -- Chargement du gestionnaire de pluggin

require("lazy").setup("plugins") -- Le gestionnaire de plugin va charger les pluggins contenue dans le dossier "plugins".

vim.opt.shiftwidth = 4 -- Mise en place des Tabulation == 4 espaces.
vim.wo.relativenumber = true -- Mise en place des Relatives number
