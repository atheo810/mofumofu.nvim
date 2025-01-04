require("gitsigns").setup({
    signs = {
        add          = { text = "+" },
        modify       = { text = "~" },
        delete       = { text = "_" },
        change       = { text = "|" },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl = false,      -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false,     -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false,    -- Toggle with `:Gitsigns toggle_word_diff`
    attach_to_untracked = true, -- show sign in file not in-track
    current_line_blame = false, -- show blame for current line
    current_line_blame_opts = {
        virt_text = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
        end, { expr = true })

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk)
        map("n", "<leader>hr", gs.reset_hunk)
        map("n", "<leader>hS", gs.stage_buffer)
        map("n", "<leader>hu", gs.undo_stage_hunk)
        map("n", "<leader>hd", gs.diffthis)
        map("n", "<leader>hD", function() gs.diffthis("~") end)
        map("n", "<leader>hb", gs.blame_line)
        map("n", "<leader>hB", gs.toggle_current_line_blame)
        map("n", "<leader>hp", gs.preview_hunk)
        map("n", "<leader>hP", function() gs.preview_hunk(true) end)
        map("n", "<leader>ht", gs.toggle_deleted)

        -- Text objects
        map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
        map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
})