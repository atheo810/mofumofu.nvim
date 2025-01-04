local key = vim.keymap

-- save file
key.set({ "i", "x", "n", "s" }, "<leader>s", "<cmd>w<cr><esc>", { desc = "Save File" })
-- new file
key.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- -- Move to window using the <ctrl> hjkl keys
key.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
key.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
key.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
key.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
key.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- -- Find files using Telescope command-line sugar.
local builtin = require("telescope.builtin")
key.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
key.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
key.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
key.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- -- Buffer
key.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })
key.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
key.set("n", "<leader>c", ":bdelete<CR>", { desc = "Close Buffer" })
-- Neo Tree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

-- Lazy Git
key.set("n", "<leader>lg", ":LazyGit<cr>", { desc = "Lazy Git" })

-- vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
-- vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
-- vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { desc = "Show Diagnostic Info" })

-- -- Find references using Telescope
key.set("n", "<leader>gr", function()
	require("telescope.builtin").lsp_references()
end, { desc = "Telescope Go to References" })
