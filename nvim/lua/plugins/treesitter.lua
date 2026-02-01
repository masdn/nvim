return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then return end

    configs.setup({
      ensure_installed = { "lua", "python", "javascript", "sql" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
