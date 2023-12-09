
vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.stdio"
-- If this is a love2d project, launch love 2d instead instead of regular repl
local conf_file_path = vim.fn.expand('%:p:h') .. '/conf.lua'
local is_love = false
if vim.fn.filereadable(conf_file_path) == 1 then
    for _, line in ipairs(vim.fn.readfile(conf_file_path)) do
        if string.find(line, 'love') then
            is_love = true
            break
        end
    end
end
if is_love then
    vim.g["conjure#client#fennel#stdio#command"] = "love ."
end
vim.g["conjure#filetypes"] = {"clojure", "fennel", "janet", "racket", "scheme", "reader"}

vim.keymap.set("n", "<LocalLeader>eR", ":ConjureFnlEvalReload<cr>", {noremap = true, silent = true})
