return {
    "nvim-treesitter/nvim-treesitter",
    --"nvim-treesitter/nvim-treesitter-textobjects",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" }, -- For lazy load.
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
   --     require "nvim-treesitter-textobjects"
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "vimdoc", "javascript", "typescript", "c", "c_sharp", "lua", "rust",
                "jsdoc", "bash", "go", "python", "markdown_inline",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
            auto_install = true,

            indent = {
                enable = true
            },

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-b>", -- c-space on osx changes key lang.
                    node_incremental = "<C-b>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            -- With this enabled you can now use <C-space> (Ctrl + space) to select the current node in the syntax tree your cursor is in. 
            -- If you keep executing this keymap, the selection will expand to the parent node until you have selected the whole file. 
            -- You can go backwards with <bs> (backspace).

            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                        ['ii'] = '@conditional.inner',
                        ['ai'] = '@conditional.outer',
                        ['il'] = '@loop.inner',
                        ['al'] = '@loop.outer',
                        ['at'] = '@comment.outer',
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        [']m'] = '@function.outer',
                        [']]'] = '@class.outer',
                    },
                    goto_next_end = {
                        [']M'] = '@function.outer',
                        [']['] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['[m'] = '@function.outer',
                        ['[['] = '@class.outer',
                    },
                    goto_previous_end = {
                        ['[M'] = '@function.outer',
                        ['[]'] = '@class.outer',
                    },
                    -- goto_next = {
                    --   [']i'] = "@conditional.inner",
                    -- },
                    -- goto_previous = {
                    --   ['[i'] = "@conditional.inner",
                    -- }
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>a'] = '@parameter.inner',
                    },
                    swap_previous = {
                        ['<leader>A'] = '@parameter.inner',
                    },
                },
            },

        })

        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = {"src/parser.c", "src/scanner.c"},
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")
    end
}
