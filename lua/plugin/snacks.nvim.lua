return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = { enabled = true },
    bigfile = { enabled = true },
    -- The opening dashboard.
    dashboard = {
      enabled = true,
      width = 65,
      preset = {
        header = [[
██████╗ ███████╗███╗   ██╗███████╗ ██████╗  █████╗ ██████╗ ███████╗
██╔══██╗██╔════╝████╗  ██║██╔════╝██╔════╝ ██╔══██╗██╔══██╗██╔════╝
██████╔╝█████╗  ██╔██╗ ██║█████╗  ██║  ███╗███████║██║  ██║█████╗  
██╔══██╗██╔══╝  ██║╚██╗██║██╔══╝  ██║   ██║██╔══██║██║  ██║██╔══╝  
██║  ██║███████╗██║ ╚████║███████╗╚██████╔╝██║  ██║██████╔╝███████╗
╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = "<leader>ff" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = "󰒲 ", key = "l", desc = "Lazy Plugin Manager", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "m", desc = "Mason LSP Manager", action = ":Mason" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys",         gap = 1 },
        { section = "recent_files", padding = { 1, 1 }, limit = 10 },
        { section = "startup" },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    -- Picker config.
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
          },
        },
      },
    },
    notifier = {
      enabled = true,
      style = "minimal"
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 15, total = 150 },
      },
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "]]", function() Snacks.words.jump(1) end,  desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-1) end, desc = "Prev Reference", mode = { "n", "t" } },
  },
}
