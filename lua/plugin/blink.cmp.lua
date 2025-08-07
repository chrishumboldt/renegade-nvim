return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.6.0',
  opts = {
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        update_delay_ms = 50,
      }
    },
    keymap = {
      preset = 'default',
      ['<CR>'] = { 'accept', 'fallback' },
      ['<C-y>'] = {},
    },
    appearance = {
      nerd_font_variant = 'normal'
    },
    signature = {
      enabled = true
    },
    fuzzy = { implementation = "prefer_rust" }
  },
}

