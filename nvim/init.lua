vim.g.mapleader = " "

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- basics
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

-- plugins
require("lazy").setup({
  require("plugins.treesitter"),
  require("plugins.glow"),
  require("plugins.colorscheme"),
})

vim.keymap.set("n", "<leader>p", "<C-o>", { noremap = true })
vim.keymap.set("n", "<leader>o", "<C-i>", { noremap = true })
vim.keymap.set("n", "<leader>t", "o- [ ] ", { noremap = true })
vim.keymap.set("i", "<C-t>", "- [ ] ", { noremap = true })
vim.keymap.set("n", "<leader>x", function()
  local line = vim.api.nvim_get_current_line()
  local new = line

  if line:match("%- %[% %]") then
    new = line:gsub("%- %[% %]", "- [x]", 1)
  elseif line:match("%- %[x%]") then
    new = line:gsub("%- %[x%]", "- [ ]", 1)
  end

  if new ~= line then
    vim.api.nvim_set_current_line(new)
  end
end, { noremap = true })
