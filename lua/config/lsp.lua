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
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Show code actions" },
      d = { "<cmd>Telescope lsp_definitions<CR>", "Go to definitions" },
      l = { vim.diagnostic.open_float, "Line Diagnostics" },
      r = { "<cmd>Telescope lsp_references<CR>", "Show references" },
      e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show full error" },
      f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format code" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
      h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
    },
  })

  -- Typescript specific keymaps.
  if client.name == "tsserver" then
    wk.register({
      ["<leader>cR"] = { ":TypescriptRenameFile<CR>", "Rename file and update imports" },
      ["<leader>cO"] = { ":TypescriptOrganizeImports<CR>", "Organise imports" },
      ["<leader>cU"] = { ":TypescriptRemoveUnused<CR>", "Remove unused variables" },
      ["<leader>c"] = {
        name = "Code",
        f = { "<cmd>Prettier<CR>", "Format code" },
      },
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
