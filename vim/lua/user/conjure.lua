
vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"
vim.g["conjure#client#fennel#stdio#command"] = "love ."
vim.g["conjure#filetypes"] = {"clojure", "fennel", "janet", "racket", "scheme", "reader"}

vim.keymap.set("n", "<LocalLeader>eR", ":ConjureFnlEvalReload<cr>", {noremap = true, silent = true})
