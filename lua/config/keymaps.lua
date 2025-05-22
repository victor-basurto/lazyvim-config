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
local telescope = require("telescope")
keymap.set("n", "<leader>ff", telescopeBuiltin.find_files, { desc = "Telescope find files" })
keymap.set("n", "<leader>fg", telescopeBuiltin.live_grep, { desc = "Telescope live grep" })
keymap.set("n", "<leader>fb", telescopeBuiltin.buffers, { desc = "Telescope buffers" })
keymap.set("n", "<leader>fh", telescopeBuiltin.help_tags, { desc = "Telescope help tags" })
keymap.set("n", "<leader>fi", telescopeBuiltin.resume, { desc = "Telescope resume" })
keymap.set("n", "<leader>fj", telescopeBuiltin.diagnostics, { desc = "Telescope diagnostics" })
keymap.set("n", "<leader>fk", telescopeBuiltin.treesitter, { desc = "Telescope treesitter" })
keymap.set("n", "<leader>fl", function()
  local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
  end
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 },
  })
end)
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

-- inc rename
keymap.set("n", "<leader>rn", ":IncRename ")

-- obsidian
-- apply template `notes.md` to new notes
keymap.set("n", "<leader>on", ":ObsidianTemplate notes<CR> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<CR>")
-- strip date from note title and replace dashes with spaces
keymap.set("n", "<leader>of", ":s/\\(#\\)[^_]*_/\\1/ | s/-/ /g<CR>")
-- TODO: add keymap to move file in current buffer to zettelkasten folder
-- TODO: add keymap to delete file in current buffer
-- end obsidian
