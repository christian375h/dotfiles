return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = "make"
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            'nvim-telescope/telescope-fzf-native.nvim'
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                }
            })
            require('telescope').load_extension('fzf')
        end,
        keys = {
            { "<leader>pf", function() require("telescope.builtin").find_files() end },
            { "<C-p>",      function() require("telescope.builtin").git_files() end },
            { "<leader>ps", function() require("telescope.builtin").live_grep() end },
            { "<leader>pd", function() require("telescope.builtin").lsp_definitions() end },
        }
    }
}
