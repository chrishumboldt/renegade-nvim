return {
  "f-person/git-blame.nvim",
  init = function ()
    vim.g.gitblame_enabled = 1
    vim.g.gitblame_set_extmark_options = {
      priority = 10000
    }
  end
}
