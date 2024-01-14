return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "c",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "vimdoc",
            }

        }
    },
    {
        "mbbill/undotree",
        "tpope/vim-fugitive"
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 0.85, -- shade the backdrop of Zen window.
                width = 140,
                height = 0.9,
                priority = 100
            }
        }
    }
}
