return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",
    -- Useful status updates for LSP
    { "j-hui/fidget.nvim", opts = {} },
    "jose-elias-alvarez/typescript.nvim",
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
}
