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

local wk_status, wk = pcall(require, "which-key")
if not wk_status then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()
local on_attach = function(client, _)
  wk.register({
    ["<leader>c"] = {
      name = "Code",
      a = { "<cmd>Lspsaga code_action<CR>", "Show code actions" },
      d = { "<cmd>Lspsaga goto_definition<CR>", "Go to definition" },
      e = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show full error" },
      f = { "<cmd>Prettier<CR>", "Format code" },
      h = { "<cmd>Lspsaga hover_doc<CR>", "Show quick definition" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
      o = { "<cmd>Lspsaga outline<CR>", "Toggle outline" },
      p = { "<cmd>Lspsaga peek_definition<CR>", "Peek at definition" },
      r = { "<cmd>Lspsaga rename<CR>", "Smart rename" },
      s = { "<cmd>Lspsaga lsp_finder<cr>", "Show definition / references" },
    },
  })

  -- Typescript specific keymaps.
  if client.name == "tsserver" then
    wk.register({
      ["<leader>cR"] = { ":TypescriptRenameFile<CR>", "Rename file and update imports" },
      ["<leader>cO"] = { ":TypescriptOrganizeImports<CR>", "Organise imports" },
      ["<leader>cU"] = { ":TypescriptRemoveUnused<CR>", "Remove unused variables" },
    })
  end
end

lsp.preset("recommended")
lsp.ensure_installed({
  "cssls",
  "jsonls",
  "lua_ls",
  "marksman",
  "rust_analyzer",
  "svelte",
  "taplo",
  "tsserver",
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
