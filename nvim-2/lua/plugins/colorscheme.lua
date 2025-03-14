return {
  "EdenEast/nightfox.nvim",
  lazy = false,  -- Charger immédiatement le plugin
  priority = 1000, -- S'assurer qu'il est chargé en premier
  config = function()
    vim.cmd("colorscheme carbonfox")
  end,
}

