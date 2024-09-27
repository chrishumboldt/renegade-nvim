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
  wk.add({
    { "<leader>c",  group = "Code" },
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",    desc = "Show code actions" },
    { "<leader>cd", "<cmd>Telescope lsp_definitions<CR>",        desc = "Go to definitions" },
    { "<leader>ce", "<cmd>lua vim.diagnostic.open_float()<CR>",  desc = "Show full error" },
    { "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>",         desc = "Format code" },
    { "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<CR>",          desc = "Hover" },
    { "<leader>ci", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" },
    { "<leader>cl", vim.diagnostic.open_float,                   desc = "Line Diagnostics" },
    { "<leader>cr", "<cmd>Telescope lsp_references<CR>",         desc = "Show references" },
    { "<leader>cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature help" },
  })

  -- Typescript specific keymaps.
  if client.name == "ts_ls" then
    wk.add({
      { "<leader>c",  group = "Code" },
      { "<leader>cf", "<cmd>Prettier<Cr>",              desc = "Format code" },
      { "<leader>cR", ":TypescriptRenameFile<CR>",      desc = "Rename file and update imports" },
      { "<leader>cO", ":TypescriptOrganizeImports<CR>", desc = "Organise imports" },
      { "<leader>cU", ":TypescriptRemoveUnused<CR>",    desc = "Remove unused variables" },
    })
  end
end

lsp.preset("recommended")
lsp.ensure_installed({
  "cssls",
  "gopls",
  "jsonls",
  "lua_ls",
  "marksman",
  "svelte",
  "taplo",
  "ts_ls",
  "zls",
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

lsp.configure("gopls", {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
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
