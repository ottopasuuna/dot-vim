local opts = {noremap = true, silent = true}

local function nmap (key, binding)
    vim.keymap.set("n", key, binding, opts)
end

local function tmap (key, binding)
    vim.keymap.set("t", key, binding, {silent = true})
end

local function imap (key, binding)
    vim.keymap.set("i", key, binding, opts)
end

local function vmap (key, binding)
    vim.keymap.set("v", key, binding, opts)
end

-- ----------------------
-- Global leader mappings
-- ----------------------
local function leader (key, binding)
    nmap("<leader>" .. key, binding)
end

-- Edit vim config
-- leader("ev", ":edit $MYVIMRC<cr>")
-- leader("ek", ":edit ~/.vim/lua/user/keymaps.lua<cr>") -- TODO: better way to refer to this file?
-- leader("elsp", ":edit ~/.vim/lua/user/nvim-lspconfig.lua<cr>")
leader("sv", ":source $MYVIMRC<cr>")
leader("sx", ":w<cr>:source %<cr>")

leader("gs", ":tabe<CR>:Git<cr>")
leader("gm", ":GitMessenger<cr>")

leader("tf", ":TestFile<cr>")
leader("tn", ":TestNearest<cr>")
leader("tl", ":TestLast<cr>")

-- Close current tab
leader("tq", ":tabc<cr>")

-- Toggle spelling
leader("sp", ":set spell!<cr>")

-- -------------
-- Function keys
-- -------------
nmap("<F1>", ":e.<cr>")
nmap("<F2>", ":UndotreeToggle<cr>")
nmap("<F3>", ":NERDTreeToggle<cr>")

nmap("<F5>", ":Neomake!<cr>")

nmap("<F8>", ":TagbarToggle<cr>")


-- -----------------
-- Terminal Bindings
-- -----------------
-- TODO: Doesn't work anymore?
tmap("<ESC><ESC>", "<C-\\><C-n>")
tmap("<A-h>", "<C-\\><C-N><C-w>h")
tmap("<A-j>", "<C-\\><C-N><C-w>j")
tmap("<A-k>", "<C-\\><C-N><C-w>k")
tmap("<A-l>", "<C-\\><C-N><C-w>l")

-- Slime bindings
leader("cc", "<Plug>SlimeParagraphSend")

-- -- Telescope bindings
local has_tele, builtin = pcall(require, "telescope.builtin")
if has_tele then
    function find_vim_config()
        builtin.git_files{
            cwd="~/.config/nvim",
            prompt="~ nvim config ~",
        }
    end
    leader('ff', builtin.git_files)
    leader('fF', builtin.find_files)
    leader('fb', builtin.buffers)
    leader('ft', builtin.tags)
    leader('fg', builtin.current_buffer_tags)
    leader('fr', builtin.live_grep)
    leader('fv', find_vim_config)
end

-- -----------
-- LSP handler
-- -----------
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function lsp_handler(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>li', "<cmd>LspInfo<cr>", bufopts)
  vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>lca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
end

-- -------------------
-- Nvim-cmp bindings
-- -------------------
local has_cmp, cmp = pcall(require, "cmp")
local has_luasnip, luasnip = pcall(require, "luasnip")
if has_cmp and has_luasnip then
    -- local check_backspace = function()
    --   local col = vim.fn.col "." - 1
    --   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    -- end
    cmp_bindings = {
      ['<C-y>'] = cmp.mapping.scroll_docs(-4),
      ['<C-e>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      -- ['<C-e>'] = cmp.mapping.abort(),
      -- ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = false },
      ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_next_item()
          elseif luasnip.expandable() then
              luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
          -- elseif check_backspace() then
          --     fallback()
          else
              fallback()
          end
        end, { "i", "s", }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
       end, { "i", "s", }),
    }
else
    cmp_bindings = {}
end


-- Misc bindings



local M = {}
M.lsp_handler = lsp_handler
M.cmp_bindings = cmp_bindings
M.leader = leader
return M
