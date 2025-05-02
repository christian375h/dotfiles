return {
    'EdenEast/nightfox.nvim',
    config = function()
        vim.cmd('colorscheme terafox')
    end
}

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
