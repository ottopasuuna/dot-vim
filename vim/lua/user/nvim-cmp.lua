local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    vim.notify("failed to init nvim-cmp")
    return
end

local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    vim.notify("failed to init luasnip")
    return
end


cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    -- experimental = {
    --     native_menu = false,
    -- },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
      -- documentation = {
      --   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      -- }
    },
    preselect = cmp.PreselectMode.None,
    -- completion = { autocomplete = false }, -- Disable automatic pop-up
    mapping = cmp.mapping.preset.insert(require('user.keymaps').cmp_bindings),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'tags'},
      { name = 'luasnip' },
      { name = 'path' },
      -- { name = 'conjure' },
      { name = 'buffer',
        option = {
        get_bufnrs = function() -- Pull from all visible buffers
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
        end
        }},
      { name = 'env', option={eval_on_confirm = false}},
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})
