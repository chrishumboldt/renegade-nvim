local wk_status, wk = pcall(require, "which-key")
if not wk_status then
  return
end

-- Strange cases.
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word" })
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete and keep yank" })
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent less" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent more" })
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Register with Which Key.
wk.register({
  ["<C-\\>"] = { "<cmd>ToggleTerm<CR>", "Show floating terminal" },
  ["<C-d>"] = { "<C-d>zz", "Scroll down half a page" },
  ["<C-e>"] = { "<C-u>zz", "Scroll up half a page" },
  ["<C-J>"] = { "<C-w>h", "Go to left pane" },
  ["<C-K>"] = { "<C-w>j", "Go to lower pane" },
  ["<C-I>"] = { "<C-w>k", "Go to upper pane" },
  ["<C-L>"] = { "<C-w>l", "Go to right pane" },
  ["<leader>|"] = { "<cmd>vsp<cr>", "Horizontal pane split" },
  ["<leader>-"] = { "<cmd>sp<cr>", "Vertical pane split" },
  ["<leader>E"] = { "<diagnostic>open_float<cr>", "Open floating diagnostic message" },
  ["<leader>e"] = { "<cmd>Neotree toggle<cr>", "Toggle file explorer" },
  ["<leader>f"] = {    
    name = "Find",
    H = { "<cmd>Telescope highlights<cr>", "Find highlights" },
    W = { "<cmd>Telescope live_grep<cr>", "Find word in project" },
    c = { "<cmd>Telescope git_commits<CR>", "Find git commit" },
    d = { "<cmd>Telescope diagnostics<cr>", "Find in diagnostics" },
    f = { "<cmd>Telescope find_files<cr>", "Find file" },
    h = { "<cmd>Telescope help_tags<cr>", "Find help" },
    r = { "<cmd>Telescope oldfiles<cr>", "Find recently opened files" },
    s = { "<cmd>Telescope git_status<CR>", "Find file by git status" },
    t = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>", "Find Find TODO/FIX/FIXME in Trouble" },
    w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find word in current file" },
    x = { "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>", "Find TODO/FIX/FIXME" },
    z = { "<cmd>TodoTelescope<CR>", "Find all TODO's" },
  },
  ["<leader>H"] = { "<cmd>WhichKey<cr>", "Show key maps" },
  ["<leader>L"] = { "<cmd>Lazy<cr>", "Open Lazy plugin manager" },
  ["<leader>M"] = { "<cmd>Mason<cr>", "Open Mason plugin manager" },
  ["<leader>Q"] = { "<cmd>qa<cr>", "Quit nvim" },
  ["<leader>t"] = {
    name = "Trouble diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "Toggle trouble" },
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

wk.register({
  ["<C-\\>"] = { "<cmd>ToggleTerm<CR>", "Close floating terminal" }
}, { mode = "t" })
