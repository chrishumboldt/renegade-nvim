return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",
    "jose-elias-alvarez/typescript.nvim",
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
}
