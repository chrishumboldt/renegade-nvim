return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            staticcheck = true,
            gofumpt = true,
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            },
          },
        },
      },
      svelte = {},
      ts_ls = {},
    }
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    local wk = require("which-key")

    -- Attach the blink capabilities.
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        wk.add({
          { "<leader>c",  group = "Code" },
          { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",                 desc = "Show code actions" },
          { "<leader>cd", function() Snacks.picker.pick("lsp_definitions") end,     desc = "Go to definitions" },
          { "<leader>ce", "<cmd>lua vim.diagnostic.open_float()<CR>",               desc = "Show full error" },
          { "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>",                      desc = "Format code" },
          { "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<CR>",                       desc = "Hover" },
          { "<leader>ci", function() Snacks.picker.pick("lsp_implementations") end, desc = "Go to implementation" },
          { "<leader>cl", vim.diagnostic.open_float,                                desc = "Line Diagnostics" },
          { "<leader>cr", function() Snacks.picker.pick("lsp_references") end,      desc = "Show references" },
          { "<leader>cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>",              desc = "Signature help" },
        })

        -- Typescript specific keymaps.
        if client.name == "ts_ls" then
          wk.add({
            { "<leader>c",  group = "Code" },
            { "<leader>cf", "<cmd>Prettier<Cr>", desc = "Format code" },
          })
        end
      end,
    })
  end
}
