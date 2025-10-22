return {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            transparent_mode = true,
            italic = {
                strings = true,
                comments = true,
                operators = false,
                folds = true,
            },
        })
        vim.cmd.colorscheme("gruvbox")
    end
}

-- return {
--     'EdenEast/nightfox.nvim',
--     config = function()
--         vim.cmd('colorscheme terafox')
--     end
-- }

--[[return {
    {
        'Mofiqul/dracula.nvim',
        config = function()
            local dracula = require("dracula")
            dracula.setup()
            vim.cmd('colorscheme dracula')
        end,
    },
}]--j

--[[return {
    {
        'comfysage/evergarden',
        priority = 1000,
        config = function()
            require('evergarden').setup {
                transparent_background = false,
                contrast_dark = 'soft',       -- Options: 'hard', 'medium', 'soft'
            }
            vim.cmd('colorscheme evergarden')
        end,
    },
}]] --j
