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
      preset = {
        header = [[
  ██████╗ ███████╗███╗   ██╗███████╗ ██████╗  █████╗ ██████╗ ███████╗
  ██╔══██╗██╔════╝████╗  ██║██╔════╝██╔════╝ ██╔══██╗██╔══██╗██╔════╝
██████╔╝█████╗  ██╔██╗ ██║█████╗  ██║  ███╗███████║██║  ██║█████╗
██╔══██╗██╔══╝  ██║╚██╗██║██╔══╝  ██║   ██║██╔══██║██║  ██║██╔══╝
  ██║  ██║███████╗██║ ╚████║███████╗╚██████╔╝██║  ██║██████╔╝███████╗
  ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝
      ]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "g", desc = "Find Word In Project", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "c", desc = "NeoVim Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy Plugin Manager", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "M", desc = "Mason LSP Manager", action = ":Mason" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
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
      layout = {
        preset = "ivy",
        layout = {
          box = "vertical",
          backdrop = false,
          row = -1,
          width = 0,
          height = 0.6,
          border = "top",
          title = " {title} {live} {flags}",
          title_pos = "center",
          {
            win = "input",
            height = 1,
            border = "bottom",
          },
          {
            box = "horizontal",
            height = 1,
          },
          {
            box = "horizontal",
            { win = "list",    border = "none" },
            { win = "preview", title = "{preview}", width = 0.6, border = "none" },
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
