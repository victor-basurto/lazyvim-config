-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local telescopeBuiltin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescopeBuiltin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescopeBuiltin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescopeBuiltin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescopeBuiltin.help_tags, { desc = "Telescope help tags" })

-- neo tree
local neo = require("neo-tree.command")
vim.keymap.set("n", "<leader>o", function()
  neo.execute({ command = "focus" })
end, { desc = "NeoTree Focus" })

-- neoGen
local neoGenOpts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ng", ":lua require('neogen').generate()<CR>", neoGenOpts)
