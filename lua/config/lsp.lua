-- Safe imports.
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

-- Start setting up the server stuff.
mason.setup()

mason_lspconfig.setup({
  automatic_installation = true,
  ensure_installed = {
    "cssls",
    "html",
    "jsonls",
    "svelte",
    "tsserver",
    "yamlls"
  },
})

-- Enable keybinds only for when lsp server available.
local keymap = vim.keymap
local on_attach = function(client, bufnr)
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Show definition / references"
  })
  keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Go to declaration"
  })
  keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Peek at definition"
  })
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Go to implementation"
  })
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Show code actions"
  })
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Smart rename"
  })
  keymap.set("n", "<leader>pd", function() vim.diagnostic.open_float() end, {
    noremap = true, silent = true, buffer = bufnr, desc = "Open diagnostic"
  })
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Show line diagnostics"
  })
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Show cursor diagnostics"
  })
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Jump to previous diagnostic"
  })
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Jump to next diagnostic"
  })
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", {
     noremap = true, silent = true, buffer = bufnr, desc = "Show quick definition"
  })

  -- Typescript specific keymaps.
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", { desc = "Rename file and update imports" })
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", { desc = "Organise imports" })
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", { desc = "Remove unused variables" })
  end
end

-- Used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["svelte"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      -- Make the language server recognize "vim" global.
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- Make language server aware of runtime files.
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
