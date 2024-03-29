local options = {
    compatible = false,
    hidden = true,
    fileencoding = "utf-8",
    swapfile = false,
    backup = false,
    splitright = true,
    mouse = "a",
    clipboard = "unnamedplus",
    number = true,
    lazyredraw = true,
    completeopt = {"menuone", "noselect"},
    -- Expand tabs to 4 spaces
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    expandtab = true,

    foldmethod = marker,
    ignorecase = true,
    smartcase = true,
    fixendofline = false,
    cursorline = true,
    -- list = true,
    -- listchars = {tab="»·",eol="¬"},
}

for k, v in pairs(options) do
    -- vim.notify(k)
    vim.opt[k] = v
end


vim.g.python3_host_prog = "$HOME/.local/share/miniconda3/envs/neovim/bin/python"
-- -----------------------------
-- Misc plugin options
--  Many plugins just have a few tweeks and don't warrant a dedicated file
-- -----------------------------
vim.g.git_messenger_always_into_popup = true

vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,janet,fennel,racket"
vim.g.sexp_enable_insert_mode_mappings = false

vim.g.slime_no_mappings = 1
vim.g.slime_target = "tmux"
vim.g.slime_default_config = {socket_name = "default", target_pane = "1"}

vim.g.taskwiki_markup_syntax = 'markdown'
vim.g.taskwiki_taskrc_location = ".config/task/taskrc"

vim.g.indentLine_concealcursor = ""

vim.g.qs_highlight_on_keys = {"f", "F", "t", "T"}
-- ------------
-- Autocommands
-- ------------
-- Higlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() vim.highlight.on_yank({on_visual=true,timeout=150}) end,
})
