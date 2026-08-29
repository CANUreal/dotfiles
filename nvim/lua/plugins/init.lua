return {

    -- Mason LSP Installer
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "gopls",
                    "lua_ls",
                    "bashls",
                    "pyright",
                },
            })

            local servers = {
                "gopls",
                "lua_ls",
                "bashls",
                "pyright",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {})
                vim.lsp.enable(server)
            end
        end,
    },

    -- Completion (Blink.cmp)
    {
        "saghen/blink.cmp",
        version = "*",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        opts = {
            keymap = {
                preset = "none",
                ["<Tab>"] = { "accept", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<Up>"] = { "select_prev", "fallback" },
                ["<CR>"] = {},
            },
            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },
            },
        },
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "go",
                "lua",
                "python",
                "bash",
                "json",
                "yaml",
            },
            highlight = {
                enable = true,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter").setup(opts)
        end,
    },

   -- Dosya Ağacı (NvimTree)
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 30,
                    side = "left",
                },
                renderer = {
                    group_empty = true,
                },
            })
            vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
        end,
    }, 

    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    diagnostics = "nvim_lsp",
                    separator_style = "thin",
                },
            })
            vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
            vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
            vim.keymap.set("n", "<A-c>", ":bdelete<CR>", { silent = true })
        end,
    },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 15,
                open_mapping = [[<C-\>]],
                direction = "horizontal",
                shade_terminals = true,
            })
        end,
    },
    
    -- edited below this!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    {
        "bluz71/vim-nightfly-colors",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("nightfly")
        end,
    },
    -- Bottom bart 
    {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto", 
                section_separators = "",
                component_separators = "",
            },
        })
    end,
    },
    -- Completion 
    require("lazy").setup({
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({})
      end,
    },
    }, {})

} 
