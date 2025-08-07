local wk_status, wk = pcall(require, "which-key")
if not wk_status then
  return
end

-- Strange cases.
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace current word" })
vim.keymap.set({ "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set({ "v" }, "<leader>d", [["_d]], { desc = "Delete and keep yank" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent less" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent more" })
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Register with Which Key.
wk.add({
  { "<A-Down>",   require("smart-splits").resize_down,                          desc = "Resize pane down" },
  { "<A-Left>",   require("smart-splits").resize_left,                          desc = "Resize pane left" },
  { "<A-Right>",  require("smart-splits").resize_right,                         desc = "Resize pane right" },
  { "<A-Up>",     require("smart-splits").resize_up,                            desc = "Resize pane up" },
  { "<C-Down>",   require("smart-splits").move_cursor_down,                     desc = "Go to lower pane" },
  { "<C-Left>",   require("smart-splits").move_cursor_left,                     desc = "Go to left pane" },
  { "<C-Right>",  require("smart-splits").move_cursor_right,                    desc = "Go to right pane" },
  { "<C-Up>",     require("smart-splits").move_cursor_up,                       desc = "Go to upper pane" },
  { "<leader>|",  "<C-w>v",                                                     desc = "Horizontal pane split" },
  { "<leader>-",  "<C-w>s",                                                     desc = "Vertical pane split" },
  { "<leader>=",  "<C-w>=",                                                     desc = "Make splits equal size" },
  { "<leader>:",  function() Snacks.picker.command_history() end,               desc = "Command History" },
  { "<leader>e",  "<cmd>Oil<cr>",                                               desc = "Enter oil file explorer" },
  { "<leader>f",  group = "Find" },
  { "<leader>fb", function() Snacks.picker.pick("buffers") end,                 desc = "Find buffer" },
  { "<leader>ff", function() Snacks.picker.pick("files") end,                   desc = "Find file" },
  { "<leader>fh", function() Snacks.picker.pick("help") end,                    desc = "Find some help" },
  { "<leader>fm", function() Snacks.picker.pick("man") end,                     desc = "Find man page" },
  { "<leader>fl", function() Snacks.picker.pick("loclist") end,                 desc = "Find location list" },
  { "<leader>fp", function() Snacks.picker.pick("live_grep") end,               desc = "Find word in project" },
  { "<leader>fr", function() Snacks.picker.pick("oldfiles") end,                desc = "Find recent file" },
  { "<leader>fs", function() Snacks.picker.pick("lsp_symbols") end,             desc = "Find LSP symbols" },
  { "<leader>fu", function() Snacks.picker.pick("undo") end,                    desc = "Find in undo history" },
  { "<leader>fw", function() Snacks.picker.pick("lines") end,                   desc = "Find word in current file" },
  { "<leader>gb", function() Snacks.gitbrowse() end,                            desc = "Open file in Git (browser)" },
  { "<leader>gg", function() Snacks.lazygit() end,                              desc = "Open LazyGit" },
  { "<leader>gs", function() Snacks.picker.git_status() end,                    desc = "Open Git status" },
  { "<leader>t",  group = "Trouble diagnostics" },
  { "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Trouble buffer diagnostics" },
  { "<leader>tk", "<cmd>Trouble loclist toggle<cr>",                            desc = "Trouble locklist" },
  { "<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "Trouble LSP references" },
  { "<leader>tq", "<cmd>Trouble qflist toggle<cr>",                             desc = "Trouble quickfix" },
  { "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Trouble symbols diagnostics" },
  { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Open Trouble" },
})
