return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = {
        folder_level = 3,
      },
      ui = {
        code_action = ""
      }
    })
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" }
  }
}
