local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    vim.notify("Could not init lsp")
    return
end

require "user.lsp.mason"
vim.notify("lsp setup")
