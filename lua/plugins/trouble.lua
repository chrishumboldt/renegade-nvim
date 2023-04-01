return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
      {silent = true, noremap = true, desc = "Toggle trouble"}
    )
    vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
      {silent = true, noremap = true, desc = "Trouble workspace diagnostics"}
    )
    vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
      {silent = true, noremap = true, desc = "Trouble document diagnostics"}
    )
    vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
      {silent = true, noremap = true, desc = "Trouble locklist"}
    )
    vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
      {silent = true, noremap = true, desc = "Trouble quickfix"}
    )
    vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
      {silent = true, noremap = true, desc = "Trouble LSP references"}
    )
  end
}
