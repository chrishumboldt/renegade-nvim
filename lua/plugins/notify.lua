return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      render = "minimal",
      stages = "static",
      top_down = false,
    })
  end
}
