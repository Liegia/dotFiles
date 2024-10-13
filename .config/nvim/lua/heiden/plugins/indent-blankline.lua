return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                highlight = {
                    "Nord1",
                    "Nord2",
                    "Nord3",
                    "Nord4",
                },
            },
        },

        config = function(_, opts)
            -- Set Nord highlights before loading the plugin
            vim.api.nvim_set_hl(0, "Nord1", { fg = "#2e3440" })
            vim.api.nvim_set_hl(0, "Nord2", { fg = "#3b4252" })
            vim.api.nvim_set_hl(0, "Nord3", { fg = "#434c5e" })
            vim.api.nvim_set_hl(0, "Nord4", { fg = "#4c566a" })

            -- Initialize the plugin with the static Nord highlights
            require("ibl").setup(opts)
        end,
    },

    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            local rainbow_delimiters = require 'rainbow-delimiters'
        end,
    }
}
-- return {
--     {
--         "lukas-reineke/indent-blankline.nvim",
--         main = "ibl",
--         opts = {
--             indent = {
--                 highlight = {
--                     "Nord1",
--                     "Nord2",
--                     "Nord3",
--                     "Nord4",
--                     "Nord5",
--                     "Nord6",
--                     "Nord7",
--                 },
--             },
--         },
-- 
--         config = function(_, opts)
--             -- Set Nord highlights before loading the plugin
--             vim.api.nvim_set_hl(0, "Nord1", { fg = "#5e81ac" })
--             vim.api.nvim_set_hl(0, "Nord2", { fg = "#81a1c1" })
--             vim.api.nvim_set_hl(0, "Nord3", { fg = "#88c0d0" })
--             vim.api.nvim_set_hl(0, "Nord4", { fg = "#8fbcbb" })
--             vim.api.nvim_set_hl(0, "Nord5", { fg = "#d8dee9" })
--             vim.api.nvim_set_hl(0, "Nord6", { fg = "#e5e9f0" })
--             vim.api.nvim_set_hl(0, "Nord7", { fg = "#eceff4" })
-- 
--             -- Initialize the plugin with the static Nord highlights
--             require("ibl").setup(opts)
--         end,
--     },
-- 
--     {
--         "HiPhish/rainbow-delimiters.nvim",
--         config = function()
--             local rainbow_delimiters = require 'rainbow-delimiters'
--         end,
--     }
-- }

-- return {
--     {
--         "lukas-reineke/indent-blankline.nvim",
--         main = "ibl",
--         opts = {
--             indent = {
--                 highlight = {
--                     "Rosepine1",
--                     "Rosepine2",
--                     "Rosepine3",
--                     "Rosepine4",
--                     "Rosepine5",
--                     "Rosepine6",
--                     "Rosepine7",
--                 },
--             },
--         },
-- 
--         config = function(_, opts)
--             -- Set Rosepine highlights before loading the plugin
--             vim.api.nvim_set_hl(0, "Rosepine1", { fg = "#ebbcba" })
--             vim.api.nvim_set_hl(0, "Rosepine2", { fg = "#f6c177" })
--             vim.api.nvim_set_hl(0, "Rosepine3", { fg = "#9ccfd8" })
--             vim.api.nvim_set_hl(0, "Rosepine4", { fg = "#c4a7e7" })
--             vim.api.nvim_set_hl(0, "Rosepine5", { fg = "#31748f" })
--             vim.api.nvim_set_hl(0, "Rosepine6", { fg = "#e0def4" })
--             vim.api.nvim_set_hl(0, "Rosepine7", { fg = "#e0def4" })
-- 
--             -- Initialize the plugin with the static Rosepine highlights
--             require("ibl").setup(opts)
--         end,
--     },
-- 
--     {
--         "HiPhish/rainbow-delimiters.nvim",
--         config = function()
--             local rainbow_delimiters = require 'rainbow-delimiters'
--         end,
--     }
-- }
-- 
