require("obsidian").setup({
  dir = "~/Sync/obsidian",
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  },
  daily_notes = {
    folder = "journal",
  }
})
