-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then -- Vérification si Lazy.nvim existe, si non, git clone le repo

  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath) -- Ajoute le chemin au repo de lazy.nvim au runtimepath (le chemin sur lequel se base nvim)

vim.g.mapleader = " " -- Met Espace en tant que leaderkey
-- vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    { import = "plugins" }, -- Précise ou se trouverons les plugins.
  },
  checker = { enabled = true }, -- Check à chaque mise à jour s'il y a une mise a jour.
})
