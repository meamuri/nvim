function ColorMyPencilsMelange(color)
    vim.opt.termguicolors = true
    color = color or "melange"
    vim.cmd.colorscheme(color)
end

function ColorMyPencilsKanagawa(color)
    color = color or "kanagawa"
    vim.cmd.colorscheme(color)
end

function ColorMyPencilsCatpuccin(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
end

function ColorMyPencilsRosePine(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
end

ColorMyPencilsMelange()
-- ColorMyPencilsRosePine()
