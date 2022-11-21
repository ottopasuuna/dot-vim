
vim.opt.splitright = true
-- -----------------------------
-- Misc plugin options
--  Many plugins just have a few tweeks and don't warrant a dedicated file
-- -----------------------------
vim.g.git_messenger_always_into_popup = true

vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,janet,fennel,racket"
vim.g.sexp_enable_insert_mode_mappings = false

-- Higlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() vim.highlight.on_yank({on_visual=true,timeout=150}) end,
})
