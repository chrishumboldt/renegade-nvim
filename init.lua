-- Some pre package manager requirements.
require("auto-command/text-yank-post")
require("config/keymap")
require("config/option")

-- Install Lazy.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Execute the Lazy package manager.
require("lazy").setup("plugins", {
  git = {
    filter = false
  }
})

-- Setup the LSP stuff last.
require("config/lsp")
