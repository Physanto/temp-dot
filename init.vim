set mouse=a
syntax enable
set showcmd
set encoding=utf-8
set showmatch
set relativenumber
set shiftwidth=4
set expandtab
set autoindent
set tabstop=2
" dependency to bufferLine
set termguicolors

" Configuration for BufferLine, map keys (can change into tabs in editor)
nnoremap <leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <C-b> :BufferLinePickClose<CR>
nnoremap <C-Tab> :BufferLineCycleNext<CR>
nnoremap <C-Tab> :BufferLineCyclePrev<CR>

" Configurtion to nvim-tree, map keys (can open and close the visor of files) 
nnoremap <C-t> :NvimTreeOpen<CR>
nnoremap <C-c> :NvimTreeClose<CR>
nnoremap <C-h> :NvimTreeResize -5<CR>
nnoremap <C-l> :NvimTreeResize +10<CR>

nnoremap <C-SHIFT-f> :hlsearch<CR>

inoremap qq <Esc>

call plug#begin()
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'navarasu/onedark.nvim'
	" Plug 'preser nvim/nerdtree'
  Plug 'nvim-tree/nvim-tree.lua'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'windwp/nvim-autopairs'
  Plug 'HiPhish/rainbow-delimiters.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'akinsho/bufferline.nvim', {'tag': '*' }
  Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

lua << END

require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
    },  
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    },
})

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'onedark'
	}
}

require('onedark').setup {
	style = "darker",
	transparent = true
}

require('onedark').load()

require('nvim-autopairs').setup()

require("nvim-tree").setup()

require("bufferline").setup{
    options = {
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close'}
        }
    }
}

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#6d9a4d" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#d379ee" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#589ad0" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight, char = '\u{2502}' } }

END

