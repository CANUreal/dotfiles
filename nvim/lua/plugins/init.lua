return {

    -- Mason LSP installer
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
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
                }
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
        end
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

                -- Öneri menüsü açıkken Tab kabul eder; kapalıysa varsayılan Tab (indent) atar
                ["<Tab>"] = { "accept", "fallback" },

                -- Ok tuşları menüde gezer, menü kapalıysa normal imleç hareketi yapar
                ["<Down>"] = { "select_next", "fallback" },
                ["<Up>"] = { "select_prev", "fallback" },

                -- Enter her zaman varsayılan alt satıra geçme işlevini korur
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
        }
    },

    -- Otomatik kapatma
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end
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

    -- Tema
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("gruvbox")
        end
    }

}
