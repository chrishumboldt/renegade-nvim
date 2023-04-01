-- Safe imports.
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

local lsp_status, lsp = pcall(require, "lsp-zero")
if not lsp_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()
local on_attach = function(client, bufnr)
  vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Show definition / references"
  })
  vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Peek at definition"
  })
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Go to implementation"
  })
  vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {
    noremap = true, silent = true, buffer = bufnr, desc = "Go to declaration"
  })
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Show code actions"
  })
  vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Smart rename"
  })
  vim.keymap.set("n", "<leader>pd", function() vim.diagnostic.open_float() end, {
    noremap = true, silent = true, buffer = bufnr, desc = "Open diagnostic"
  })
  vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Show line diagnostics"
  })
  vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Show cursor diagnostics"
  })
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Jump to previous diagnostic"
  })
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Jump to next diagnostic"
  })
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Show quick definition"
  })
  vim.keymap.set('n', '<C-k>', "<cmd>vim.lsp.buf.signature_help<CR>", {
    noremap = true, silent = true, buffer = bufnr, desc = "Definition help"
  })

  -- Typescript specific keymaps.
  if client.name == "tsserver" then
    vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", { desc = "Rename file and update imports" })
    vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", { desc = "Organise imports" })
    vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", { desc = "Remove unused variables" })
  end
end

lsp.preset("recommended")
lsp.ensure_installed({
  "cssls",
  "jsonls",
  "lua_ls",
  "marksman",
  "rust_analyzer",
  "taplo",
  "tsserver",
  "yamlls"
})

-- Some custom server setups.
lsp.configure("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

local cmp_mappings = lsp.defaults.cmp_mappings({})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil
cmp_mappings["<C-Space>"] = cmp.mapping.complete()

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(on_attach)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})
