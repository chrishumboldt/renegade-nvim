return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-Left>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<C-Down>", "<cmd>TmuxNavigateDown<cr>" },
    { "<C-Up>", "<cmd>TmuxNavigateUp<cr>" },
    { "<C-Right>", "<cmd>TmuxNavigateRight<cr>" },
  },
}
