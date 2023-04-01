local wk_status, wk = pcall(require, "which-key")
if not wk_status then
  return
end


vim.keymap.set("n", "<leader>V", vim.cmd.Ex, { desc = "Exit file to netrw" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page" })
vim.keymap.set("n", "<leader>e", "<cmd>NeoTreeRevealToggle<cr>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word" })
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete and keep yank" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right pane" })
vim.keymap.set("n", "<leader>Q", vim.cmd.qa, { desc = "Quit nvim" })
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent less" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent more" })
vim.keymap.set("n", "<leader>|", "<cmd>vsp<cr>", { desc = "Horizontal pane split" })
vim.keymap.set("n", "<leader>-", "<cmd>sp<cr>", { desc = "Vertical pane split" })
vim.keymap.set("n", "<leader>H", "<cmd>WhichKey<cr>", { desc = "Show key maps" })
vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

wk.register({
  ["<leader>f"] = {
    name = "Find",
    f = { "<cmd>Telescope find_files<cr>", "Find file" },
    r = { "<cmd>Telescope oldfiles<cr>", "Find recently opened files" },
    h = { "<cmd>Telescope help_tags<cr>", "Find help" },
    w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find word in current file" },
    W = { "<cmd>Telescope live_grep<cr>", "Find word in project" },
    d = { "<cmd>Telescope diagnostics<cr>", "Find in diagnostics" },
  },
  ["<leader>t"] = {
    name = "Trouble diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "Toggle trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble workspace diagnostics" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble document diagnostics" },
    k = { "<cmd>TroubleToggle loclist<cr>", "Trouble locklist" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Trouble quickfix" },
    l = { "<cmd>TroubleToggle lsp_references<cr>", "Trouble LSP references" },
  }
})
