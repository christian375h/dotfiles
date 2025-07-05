return {
    {
        "catgoose/nvim-colorizer.lua",          -- or "NvChad/nvim-colorizer.lua" if you prefer upstream
        event = { "BufReadPre", "BufNewFile" }, -- optional lazy-loading
        config = function()
            require("colorizer").setup({
                filetypes = { "*" },
                user_default_options = {
                    mode = "virtualtext",
                    virtualtext = "●",
                    virtualtext_inline = "before",
                    virtualtext_mode = "foreground",
                    RRGGBB = true,
                    RGB = true,
                    RGBA = true,
                    rgb_fn = true,
                    hsl_fn = true,
                    css = true,
                    names = false,
                },
            })
        end,
    }
}
