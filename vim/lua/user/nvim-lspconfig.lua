local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("Failed to init lspconfig")
    return
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    vim.notify("Failed to init cmp_nvim_lsp")
    return
end

local status_ok, mason = pcall(require, "mason")
if not status_ok then
    vim.notify("Failed to init mason")
    return
end

mason.setup()

-- --------------------------
-- Configure specific servers
-- --------------------------

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
local lsp_keybindings = require('user.keymaps').lsp_handler

local function on_attach(client, buffer)
    client.root_dir = "$PWD"
    lsp_keybindings(client, buffer)
end

lspconfig.clangd.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}

lspconfig.gopls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
lspconfig.pylsp.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                jedi_completion = {
                    include_params = true
                }
            }
        }
    }
}

lspconfig.sumneko_lua.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        }
    }
}

local diagnostic_config = {
    virtual_text = false,
    underline = true,
}
vim.diagnostic.config(diagnostic_config)
