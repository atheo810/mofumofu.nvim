local map = vim.keymap.set

-- save file
map({ "i", "x", "n", "s" }, "<leader>s", "<cmd>w<cr><esc>", { desc = "Save File" })
-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- -- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- -- Find files using Telescope command-line sugar.
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- -- Buffer
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
map("n", "<leader>c", ":bdelete<CR>", { desc = "Close Buffer" })
-- Neo Tree
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- Lazy Git
map("n", "<leader>lg", ":LazyGit<cr>", { desc = "Lazy Git" })

-- map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
-- map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
-- map("n", "<leader>di", vim.diagnostic.open_float, { desc = "Show Diagnostic Info" })

-- -- Find references using Telescope
map("n", "<leader>gr", function()
	require("telescope.builtin").lsp_references()
end, { desc = "Telescope Go to References" })

return {
	map = map
}
