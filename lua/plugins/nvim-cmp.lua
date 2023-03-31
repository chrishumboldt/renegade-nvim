return {
  "hrsh7th/nvim-cmp",
  dependencies = { 
    "L3MON4D3/LuaSnip", 
    { 
      "onsails/lspkind.nvim",
      init = function()
        return {}
      end,
    },
    "hrsh7th/cmp-nvim-lsp", 
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    "saadparwaiz1/cmp_luasnip" 
  },
  opts = function()
    local cmp = require("cmp")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspkind = require("lspkind")
   
    -- Here we setup the servers used for auto-completion.

    -- This is the setup that is being returned.
    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({ 
          behavior = cmp.SelectBehavior.Insert 
        }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ 
          behavior = cmp.SelectBehavior.Insert 
        }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    }
  end,
}
