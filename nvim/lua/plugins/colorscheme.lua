return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- load before other UI stuff
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
}
