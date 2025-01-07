-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
        {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        },
        { "neovim/nvim-lspconfig",
            config = function()
                local lspconfig = require("lspconfig")

                -- Conf for several LSP Server
                lspconfig.lua_ls.setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    filetype = { "lua" },
                    log_level = 2,
                    settings = {
                        Lua = {
                            runtime = {
                                version = "LuaJIT",
                                globals = { "vim" },
                            },
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                })

                lspconfig.volar.setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    filetype = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                    init_options = {
                        vue = {
                            hybridMode = false,
                        },
                    },
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterHints = "all",
                                includeInlayFunctionParameterTypes = true,
                                includeInlayVariableTypes = true,
                                includeInlayPropertyDeclarationTypes = true,
                                includeInlayFunctionLikeReturnType = true,
                            }
                        }
                    },
                })

            end,
        },
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
        {
            'williamboman/mason-lspconfig.nvim',
            opts = {
              ensure_installed = { "lua_ls", "volar", "ts_ls", },
            },
          },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp", -- LSP source
                "hrsh7th/cmp-buffer", -- Buffer source
                "hrsh7th/cmp-path", -- Path source
                "hrsh7th/cmp-cmdline", -- Cmdline source
                "L3MON4D3/LuaSnip", -- Snippet engine
                "saadparwaiz1/cmp_luasnip", -- Snippet completion
            },
            config = function()
                local cmp = require("cmp")
                cmp.setup({
                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body)
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.abort(),
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                        ["<Tab>"] = cmp.config.disable,
                        ["<S-Tab>"] = cmp.config.disable,
                    }),
                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "path" },
                        { name = "buffer" },
                    }),
                    cmp.config.window.bordered()
                })
            end,
        },
		{
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate", 
            config = function() 
                require("nvim-treesitter.configs").setup {
                    lookahead = true,
                    enable = true,
                    ensure_installed = { "c", "cpp", "lua", "vim", "javascript", "typescript", "html", "css", "json", "python" },
                    highlight = { enable = true },
                    indent = { enable = true },
                    autopairs = { enable = true },
                    fold = { enable = true },
                }
            end, 
        },
		{ "akinsho/toggleterm.nvim", config = true },
		{
            "nvim-neo-tree/neo-tree.nvim",
            version = "*",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
				"nvim-lua/plenary.nvim", 
				"MunifTanjim/nui.nvim",
            },
            config = function()
                require("neo-tree").setup {
                    close_if_last_window = true,
                    enable_git_status = true,
                    enable_diagnostics = true,
                    default_component_configs = {
                        container = {
                            enable_character_folding = true
                        },
                        file = {
                            git_status = {
                                symbols = {
                                    added     = "+",
                                    modified  = "~",
                                    deleted   = "-",
                                    renamed   = "»",
                                    untracked = "?",
                                    ignored   = "!",
                                    unstaged  = "U",
                                    staged    = "S",
                                }
                            }
                        }
                    },
                    window = {
                        mappings = {
                            ["<space>"] = "toggle_node",
                            ["o"] = "open",
                            ["h"] = "close_node",
                            ["v"] = "vsplit",
                            ["s"] = "split",
                            ["t"] = "open_tab",
                            ["<cr>"] = "open",
                            ["<esc>"] = "revert_preview",
                            ["P"] = "toggle_preview",
                            ["r"] = "rename",
                            ["d"] = "delete",
                            ["y"] = "copy",
                            ["p"] = "paste",
                            ["c"] = "create",
                            ["x"] = "cut",
                        }
                    },
                    filesystem = {
                        follow_current_file,
                        group_empty_dirs = true,
                        hijack_netrw_behaviour = "open_current",
                    },
                }
            end,
        },
		{
			"vhyrro/luarocks.nvim",
			priority = 1000,
			config = true,
		},
		{  
			"folke/which-key.nvim",
			event = "VeryLazy",
            config = function()
                local wk = require("which-key")
                wk.setup {}
                local keymaps = require("core.keymaps")
            end,
			keys = {
                {
                    "<leader>?",
                    function()
                    require("which-key").show({ global = false })
                    end,
                    desc = "Buffer Local Keymaps (which-key)",
                },
			},
		},
		{     
			"kdheepak/lazygit.nvim",
			lazy = true,
			cmd = {
				"LazyGit",
				"LazyGitConfig",
				"LazyGitCurrentFile",
				"LazyGitFilter",
				"LazyGitFilterCurrentFile",
			},
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		{
            "nvim-telescope/telescope.nvim",
            tag = "0.1.5", 
            dependencies = { "nvim-lua/plenary.nvim" },
			config = true
        },
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000, config = true },
		{
            "nvim-lualine/lualine.nvim",
            requires = { { "nvim-tree/nvim-web-devicons", lazy = true } },
			config = true
        },
		{ "lewis6991/gitsigns.nvim", config = true },
		{ "stevearc/conform.nvim", config = true },
		{ "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = true },
})
