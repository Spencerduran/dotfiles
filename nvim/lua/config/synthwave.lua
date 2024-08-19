require "fluoromachine".setup 
{
    glow = true,
    --theme = "retrowave",
    theme = "fluoromachine",
    --theme = "delta",

    overrides = overrides,
    transparent = "full",
    --colors = function(_, d)
    --    return 
    --    {
    --        bg = "#190920",
    --        alt_bg = "#190920",
    --        cyan = "#49eaff",
    --        red = "#ff1e34",
    --        yellow = "#ffe756",
    --        orange = "#f38e21",
    --        pink = "#ffadff",
    --        purple = "#9544f7",
    --    }
    --end,
}

vim.cmd.colorscheme "fluoromachine"
