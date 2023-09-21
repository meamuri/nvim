function ColorMyPencilsMelange(color)
    vim.opt.termguicolors = true
    color = color or "melange"
    vim.cmd.colorscheme(color)
end

function ColorMyPencilsKanagawa(color)
    color = color or "kanagawa"
    vim.cmd.colorscheme(color)
end

ColorMyPencilsKanagawa()
