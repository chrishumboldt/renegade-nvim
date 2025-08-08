local wk_status, wk = pcall(require, "which-key")
if not wk_status then
  return
end

local layout_vscode = {
  layout = {
    preset = "vscode",
    preview = false,
    layout = {
      backdrop = false,
      row = 1,
      width = 0.4,
      min_width = 80,
      height = 0.4,
      border = "none",
      box = "vertical",
      { win = "input",      height = 1,          border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
      { box = "horizontal", height = 1 },
      { win = "list",       border = "hpad" },
      { win = "preview",    title = "{preview}", border = "rounded" },
    },
  },
}

local layout_ivy = {
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
      { win = "input",      height = 1, border = "bottom", },
      { box = "horizontal", height = 1, },
      {
        box = "horizontal",
        { win = "list",    border = "none" },
        { win = "preview", title = "{preview}", width = 0.6, border = "none" },
      },
    },
  }
}

local layout_ivy_lines = {
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
      { win = "input",      height = 1,     border = "bottom", },
      { box = "horizontal", height = 1, },
      { win = "list",       border = "none" },
    },
  }
}

-- Strange cases.
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace current word" })
vim.keymap.set({ "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set({ "v" }, "<leader>d", [["_d]], { desc = "Delete and keep yank" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent less" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent more" })
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("n", "<C-x>", function()
  local buf = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_get_option_value("modified", { buf = buf })

  if modified then
    local choice = vim.fn.confirm("Buffer has unsaved changes. Save or Cancel?", "&Save\n&Cancel", 1)
    if choice == 1 then
      vim.cmd("write")
    elseif choice == 2 then
      return
    end
  end

  vim.cmd("bdelete")
end, { desc = "Delete buffer" })

-- Register with Which Key.
wk.add({
  { "<A-Down>",   require("smart-splits").resize_down,                                    desc = "Resize pane down" },
  { "<A-Left>",   require("smart-splits").resize_left,                                    desc = "Resize pane left" },
  { "<A-Right>",  require("smart-splits").resize_right,                                   desc = "Resize pane right" },
  { "<A-Up>",     require("smart-splits").resize_up,                                      desc = "Resize pane up" },
  { "<C-Down>",   require("smart-splits").move_cursor_down,                               desc = "Go to lower pane" },
  { "<C-Left>",   require("smart-splits").move_cursor_left,                               desc = "Go to left pane" },
  { "<C-Right>",  require("smart-splits").move_cursor_right,                              desc = "Go to right pane" },
  { "<C-Up>",     require("smart-splits").move_cursor_up,                                 desc = "Go to upper pane" },
  { "<leader>|",  "<C-w>v",                                                               desc = "Horizontal pane split" },
  { "<leader>-",  "<C-w>s",                                                               desc = "Vertical pane split" },
  { "<leader>=",  "<C-w>=",                                                               desc = "Make splits equal size" },
  { "<leader>:",  function() Snacks.picker.pick("command_history", layout_vscode) end,    desc = "Command History" },
  { "<leader>e",  "<cmd>Oil<cr>",                                                         desc = "Enter oil file explorer" },
  { "<leader>f",  group = "Find" },
  { "<leader>fb", function() Snacks.picker.pick("buffers", layout_vscode) end,            desc = "Find buffer" },
  { "<leader>ff", function() Snacks.picker.pick("files", layout_ivy) end,                 desc = "Find file" },
  { "<leader>fh", function() Snacks.picker.pick("help", layout_ivy) end,                  desc = "Find some help" },
  { "<leader>fl", function() Snacks.picker.pick("lines", layout_ivy_lines) end,           desc = "Find word line" },
  { "<leader>fm", function() Snacks.picker.pick("man", layout_vscode) end,                desc = "Find man page" },
  { "<leader>fp", function() Snacks.picker.pick("live_grep", layout_ivy) end,             desc = "Find word in project" },
  { "<leader>fr", function() Snacks.picker.pick("oldfiles", layout_ivy) end,              desc = "Find recent file" },
  { "<leader>fs", function() Snacks.picker.pick("lsp_symbols", layout_ivy) end,           desc = "Find LSP symbols" },
  { "<leader>fS", function() Snacks.picker.pick("lsp_workspace_symbols", layout_ivy) end, desc = "Find LSP project symbols" },
  { "<leader>fu", function() Snacks.picker.pick("undo", layout_vscode) end,               desc = "Find in undo history" },
  { "<leader>gb", function() Snacks.gitbrowse() end,                                      desc = "Open file in Git (browser)" },
  { "<leader>gg", function() Snacks.lazygit() end,                                        desc = "Open LazyGit" },
  { "<leader>gs", function() Snacks.picker.git_status() end,                              desc = "Open Git status" },
  { "<leader>t",  group = "Trouble diagnostics" },
  { "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",                     desc = "Trouble buffer diagnostics" },
  { "<leader>tk", "<cmd>Trouble loclist toggle<cr>",                                      desc = "Trouble locklist" },
  { "<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",           desc = "Trouble LSP references" },
  { "<leader>tq", "<cmd>Trouble qflist toggle<cr>",                                       desc = "Trouble quickfix" },
  { "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>",                          desc = "Trouble symbols diagnostics" },
  { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>",                                  desc = "Open Trouble" },
})
