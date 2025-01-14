-- Completion

return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- 'hrsh7th/cmp-copilot',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    require('luasnip/loaders/from_snipmate').lazy_load()

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local source_map = {
      buffer = "Buffer",
      nvim_lsp = "LSP",
      nvim_lsp_signature_help = "Signature",
      luasnip = "LuaSnip",
      nvim_lua = "Lua",
      path = "Path",
      copilot = "Copilot",
    }

    local function ltrim(s)
      return s:match'^%s*(.*)'
    end

    cmp.setup({
      preselect = false,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      view = {
        entries = { name = 'custom', selection_order = 'near_cursor' },
      },
      window = {
        completion = {
          col_offset = -2 -- align the abbr and word on cursor (due to fields order below)
        }
      },
      mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          elseif has_words_before() then
            cmp.complete()
            print('complete...')
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        -- ['<CR>'] = cmp.mapping(function (fallback)
        --   if cmp.visible() then
        --     if luasnip.expandable() then
        --       luasnip.expand()
        --     else
        --       cmp.confirm({
        --         select = true,
        --       })
        --     end
        --   else
        --     fallback()
        --   end
        -- end),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        -- { name = 'copilot' },
        { name = 'buffer' },
        { name = 'path' },
      },
      experimental = {
        -- ghost_text = true,
      },
    })

    -- cmp.setup.filetype("sql", {
    --   sources = cmp.config.sources({
    --     { name = 'vim-dadbod-completion' },
    --   }, {
    --     { name = 'buffer' },
    --   })
    -- })
  end,
}
