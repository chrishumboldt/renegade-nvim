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
wk.register({
  ["<C-d>"] = { "<C-d>zz", "Scroll down half a page" },
  ["<C-e>"] = { "<C-u>zz", "Scroll up half a page" },
  ["<A-Left>"] = { require("smart-splits").resize_left, "Resize pane left" },
  ["<A-Down>"] = { require("smart-splits").resize_down, "Resize pane down" },
  ["<A-Up>"] = { require("smart-splits").resize_up, "Resize pane up" },
  ["<A-Right>"] = { require("smart-splits").resize_right, "Resize pane right" },
  ["<C-Left>"] = { require("smart-splits").move_cursor_left, "Go to left pane" },
  ["<C-Down>"] = { require("smart-splits").move_cursor_down, "Go to lower pane" },
  ["<C-Up>"] = { require("smart-splits").move_cursor_up, "Go to upper pane" },
  ["<C-Right>"] = { require("smart-splits").move_cursor_right, "Go to right pane" },
  ["<leader>|"] = { "<C-w>v", "Horizontal pane split" },
  ["<leader>-"] = { "<C-w>s", "Vertical pane split" },
  ["<leader>="] = { "<C-w>=", "Make splits equal size" },
  ["<leader>E"] = { "<diagnostic>open_float<cr>", "Open floating diagnostic message" },
  ["<leader>e"] = { "<cmd>Oil<cr>", "Enter oil file explorer" },
  ["<leader>f"] = {
    name = "Find",
    H = { "<cmd>Telescope highlights<cr>", "Find highlights" },
    W = { "<cmd>Telescope live_grep<cr>", "Find word in project" },
    c = { "<cmd>Telescope git_commits<CR>", "Find git commit" },
    d = { "<cmd>Telescope diagnostics<cr>", "Find in diagnostics" },
    f = { "<cmd>Telescope find_files<cr>", "Find file" },
    h = { "<cmd>Telescope help_tags<cr>", "Find help" },
    n = { "<cmd>TodoTelescope keywords=NOTE<CR>", "Find NOTE" },
    r = { "<cmd>Telescope oldfiles<cr>", "Find recently opened files" },
    s = { "<cmd>Telescope git_status<CR>", "Find file by git status" },
    t = { "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>", "Find TODO/FIX/FIXME" },
    w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find word in current file" },
    x = { "<cmd>TodoTelescope<CR>", "Find all TODO's and stuff" },
  },
  ["<leader>H"] = { "<cmd>WhichKey<cr>", "Show key maps" },
  ["<leader>L"] = { "<cmd>Lazy<cr>", "Open Lazy plugin manager" },
  ["<leader>M"] = { "<cmd>Mason<cr>", "Open Mason plugin manager" },
  ["<leader>Q"] = { "<cmd>qa<cr>", "Quit nvim" },
  ["<leader>t"] = {
    name = "Trouble diagnostics",
    T = { "<cmd>TroubleToggle<cr>", "Open Trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble workspace diagnostics" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble document diagnostics" },
    k = { "<cmd>TroubleToggle loclist<cr>", "Trouble locklist" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble quickfix" },
    l = { "<cmd>TroubleToggle lsp_references<cr>", "Trouble LSP references" },
  },
  ["<leader>V"] = { "<cmd>Ex<cr>", "Exit file to netrw" },
  ["<leader>m"] = {
    name = "Wrapping mode",
    h = { "<cmd>HardWrapMode<cr>", "Hard wrap the current buffer" },
    s = { "<cmd>SoftWrapMode<cr>", "Soft wrap the current buffer" },
    t = { "<cmd>ToggleWrapMode<cr>", "Toggle the current wrapping mode" }
  },
  ["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
  ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<cr>", "Previous buffer" }
}, { mode = "n" })

wk.register({
  ["<C-d>"] = { "<C-d>zz", "Scroll down half a page" },
  ["<C-e>"] = { "<C-u>zz", "Scroll up half a page" }
}, { mode = "v" })
