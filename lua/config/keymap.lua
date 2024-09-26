local neoscroll_status, neoscroll = pcall(require, "neoscroll")
if not neoscroll_status then
  return
end
local scroll_duration = 150

local wk_status, wk = pcall(require, "which-key")
if not wk_status then
  return
end

-- Strange cases.
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace current word" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete and keep yank" })
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent less" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent more" })
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Register with Which Key.
wk.add({
  { "<A-Down>",    require("smart-splits").resize_down,                             desc = "Resize pane down" },
  { "<A-Left>",    require("smart-splits").resize_left,                             desc = "Resize pane left" },
  { "<A-Right>",   require("smart-splits").resize_right,                            desc = "Resize pane right" },
  { "<A-Up>",      require("smart-splits").resize_up,                               desc = "Resize pane up" },
  { "<C-Down>",    require("smart-splits").move_cursor_down,                        desc = "Go to lower pane" },
  { "<C-Left>",    require("smart-splits").move_cursor_left,                        desc = "Go to left pane" },
  { "<C-Right>",   require("smart-splits").move_cursor_right,                       desc = "Go to right pane" },
  { "<C-Up>",      require("smart-splits").move_cursor_up,                          desc = "Go to upper pane" },
  { "<C-e>",       function() neoscroll.ctrl_u({ duration = scroll_duration }) end, desc = "Scroll up" },
  { "<C-d>",       function() neoscroll.ctrl_d({ duration = scroll_duration }) end, desc = "Scroll down" },
  { "<leader>|",   "<C-w>v",                                                        desc = "Horizontal pane split" },
  { "<leader>-",   "<C-w>s",                                                        desc = "Vertical pane split" },
  { "<leader>=",   "<C-w>=",                                                        desc = "Make splits equal size" },
  { "<leader>E",   "<diagnostic>open_float<cr>",                                    desc = "Open floating diagnostic message" },
  { "<leader>e",   "<cmd>Oil<cr>",                                                  desc = "Enter oil file explorer" },
  { "<leader>f",   group = "Find" },
  { "<leader>fH",  "<cmd>Telescope highlights<cr>",                                 desc = "Find highlights" },
  { "<leader>fW",  "<cmd>Telescope live_grep<cr>",                                  desc = "Find word in project" },
  { "<leader>fc",  "<cmd>Telescope commands<cr>",                                   desc = "Find command" },
  { "<leader>fd",  "<cmd>Telescope diagnostics<cr>",                                desc = "Find in diagnostics" },
  { "<leader>ff",  "<cmd>Telescope find_files<cr>",                                 desc = "Find file" },
  { "<leader>fgb", "<cmd>Telescope git_branches<CR>",                               desc = "Find/Checkout git branches" },
  { "<leader>fgc", "<cmd>Telescope git_commits<CR>",                                desc = "Find git commit" },
  { "<leader>fgs", "<cmd>Telescope git_status<CR>",                                 desc = "Find file by git status" },
  { "<leader>fh",  "<cmd>Telescope help_tags<cr>",                                  desc = "Find help" },
  { "<leader>fi",  "<cmd>Telescope grep_string<cr>",                                desc = "Find instances of word" },
  { "<leader>fn",  "<cmd>TodoTelescope keywords=NOTE<CR>",                          desc = "Find NOTE" },
  { "<leader>fr",  "<cmd>Telescope oldfiles<cr>",                                   desc = "Find recently opened files" },
  { "<leader>fs",  "<cmd>Telescope lsp_document_symbols<CR>",                       desc = "Find document symbols" },
  { "<leader>ft",  "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>",                desc = "Find TODO/FIX/FIXME" },
  { "<leader>fw",  "<cmd>Telescope current_buffer_fuzzy_find<cr>",                  desc = "Find word in current file" },
  { "<leader>fx",  "<cmd>TodoTelescope<CR>",                                        desc = "Find all TODO's and stuff" },
  { "<leader>H",   "<cmd>WhichKey<cr>",                                             desc = "Show key maps" },
  { "<leader>L",   "<cmd>Lazy<cr>",                                                 desc = "Open Lazy plugin manager" },
  { "<leader>M",   "<cmd>Mason<cr>",                                                desc = "Open Mason plugin manager" },
  { "<leader>Q",   "<cmd>qa<cr>",                                                   desc = "Quit nvim" },
  { "<leader>t",   group = "Trouble diagnostics" },
  { "<leader>tt",  "<cmd>Trouble diagnostics toggle<cr>",                           desc = "Open Trouble" },
  { "<leader>tb",  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",              desc = "Trouble buffer diagnostics" },
  { "<leader>tk",  "<cmd>Trouble loclist toggle<cr>",                               desc = "Trouble locklist" },
  { "<leader>tl",  "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",    desc = "Trouble LSP references" },
  { "<leader>tq",  "<cmd>Trouble qflist toggle<cr>",                                desc = "Trouble quickfix" },
  { "<leader>ts",  "<cmd>Trouble symbols toggle focus=false<cr>",                   desc = "Trouble symbols diagnostics" },
  { "<leader>V",   "<cmd>Ex<cr>",                                                   desc = "Exit file to netrw" },
  { "<leader>m",   group = "Wrapping mode" },
  { "<leader>mh",  "<cmd>HardWrapMode<cr>",                                         desc = "Hard wrap the current buffer" },
  { "<leader>ms",  "<cmd>SoftWrapMode<cr>",                                         desc = "Soft wrap the current buffer" },
  { "<leader>mt",  "<cmd>ToggleWrapMode<cr>",                                       desc = "Toggle the current wrapping mode" },
  { "<Tab>",       "<cmd>BufferLineCycleNext<cr>",                                  desc = "Next buffer" },
  { "<S-Tab>",     "<cmd>BufferLineCyclePrev<cr>",                                  desc = "Previous buffer" }
}, { mode = "n" })

-- Scrolling feature for other modes.
local keymap = {
  ["<C-e>"] = function() neoscroll.ctrl_u({ duration = scroll_duration }) end,
  ["<C-d>"] = function() neoscroll.ctrl_d({ duration = scroll_duration }) end,
}
local modes = { 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end
