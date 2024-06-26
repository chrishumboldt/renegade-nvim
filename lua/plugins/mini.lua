return {
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>w", function() require("mini.bufremove").delete(0, false) end, desc = "Close buffer" },
      { "<leader>W", function() require("mini.bufremove").delete(0, true) end,  desc = "Close buffer (Force)" },
    },
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  }
}
