return {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            transparent_mode = true,
            overrides = {
                NeoTreeTitleBar = { fg = "#282828", bg = "#fbf1c7"}
            }
        })
        vim.o.background = "dark"
        vim.cmd("colorscheme gruvbox")
    end
}
