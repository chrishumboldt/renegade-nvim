return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      ui = {
        code_action = ""
      }
    })
  end,
  dependencies = {
    {"nvim-tree/nvim-web-devicons"},
    {"nvim-treesitter/nvim-treesitter"}
  }
}
