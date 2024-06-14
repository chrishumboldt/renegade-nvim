return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      render = "minimal",
      stages = "static",
    })
  end
}
