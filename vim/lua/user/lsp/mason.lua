
local mason_ok, mason = pcall(require "mason")
if not mason_ok then
    vim.notify("Could not init mason")
    return
end
local mason_ok, mason_lspconfig = pcall(require "mason-lspconfig")
if not mason_ok then
    vim.notify("Could not init mason-lspconfig")
    return
end
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    vim.notify("Failed to init cmp_nvim_lsp")
    return
end
local lspconfig = require("lspconfig")

mason.setup()
-- mason_lspconfig.setup({
--     -- ensure_installed = {},
--     -- automatic_installation = true,
-- })

local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
local lsp_keybindings = require('user.keymaps').lsp_handler

local function on_attach(client, buffer)
    lsp_keybindings(client, buffer)
end

lspconfig.gopls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
lspconfig.pylsp.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
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
                library {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        }
    }
}
