return {
  {
    "echasnovski/mini.bufremove",
    keys = {
      { "<leader>x", function() require("mini.bufremove").delete(0, false) end, desc = "Close buffer" },
      { "<leader>X", function() require("mini.bufremove").delete(0, true) end, desc = "Close buffer (Force)" },
    },
  },
}
