-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
local keymap = vim.keymap
-- discipline, custom plugin inspired by `craftzdog-max/devaslife`
local discipline = require("utilities.discipline")
discipline.cowboy()
-- end discipline
-- telescope
local telescopeBuiltin = require("telescope.builtin")
keymap.set("n", "<leader>ff", telescopeBuiltin.find_files, { desc = "Telescope find files" })
keymap.set("n", "<leader>fg", telescopeBuiltin.live_grep, { desc = "Telescope live grep" })
keymap.set("n", "<leader>fb", telescopeBuiltin.buffers, { desc = "Telescope buffers" })
keymap.set("n", "<leader>fh", telescopeBuiltin.help_tags, { desc = "Telescope help tags" })
-- end telescope

-- neo tree
local neo = require("neo-tree.command")
keymap.set("n", "<leader>o", function()
  neo.execute({ command = "focus" })
end, { desc = "NeoTree Focus" })
-- end neo tree

-- neoGen
vim.api.nvim_set_keymap("n", "<leader>ng", ":lua require('neogen').generate()<CR>", opts)

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G")

-- new tab
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- move windows
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.get_next({ buffer = 0, severity = vim.diagnostic.severity.ERROR })
end)

-- open html files in the browser
keymap.set("n", "<leader>O", function()
  vim.ui.open(vim.fn.expand("%"))
end, { desc = "Open in Browser" })
