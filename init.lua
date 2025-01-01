vim.g.have_nerd_font = true
require("config.options")
vim.o.wildmode = "longest:full,full"
-- Ignore certain file extensions for wildmenu
vim.o.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
vim.opt.timeoutlen = 200

require("config.lazy")

-- Find files using Telescope command-line sugar.
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Buffer
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { desc = "Close Buffer" })

-- Neo Tree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { desc = "Show Diagnostic Info" })
-- Find references using Telescope
vim.keymap.set("n", "<leader>gr", function()
	require("telescope.builtin").lsp_references()
end, { desc = "Telescope Go to References" })

require("config.keymaps")
