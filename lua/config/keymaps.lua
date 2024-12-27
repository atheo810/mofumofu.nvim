local key = vim.keymap

-- save file
key.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- new file
key.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Move to window using the <ctrl> hjkl keys
key.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
key.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
key.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
key.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
key.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
