vim.keymap.set("n", "<C-g>", ":Glow<CR>", { noremap = true, silent = true })

return {
  "npxbr/glow.nvim",
  cmd = "Glow",
  config = function()
    require("glow").setup({
      border = "rounded",
      style = "light",
    })
  end,
}
