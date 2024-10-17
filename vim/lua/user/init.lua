require "user.options"
require "user.keymaps"
require "user.nvim-cmp"
require "user.nvim-lspconfig"
require "user.conjure"
require "user.vimwiki"
require "user.telescope"
-- require "user.obsidian"


local projectfile = vim.fn.getcwd() .. 'project.godot'
if projectfile then
    vim.fn.serverstart './godothost'
end
