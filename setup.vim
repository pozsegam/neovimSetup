set number
set nocompatible
set title
set hlsearch
syntax on
set autoindent
set background=dark
set nobackup
set showcmd
set hlsearch
set scrolloff=10
set expandtab   
set cursorline
set smarttab
set nowrap
set tabstop=4
set shiftwidth=4
set mouse=a
set splitright

let g:colorizer_auto_filetype='css,html'

highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

call plug#begin()
Plug 'https://github.com/chrisbra/Colorizer'
Plug 'kana/vim-altr'  " Altern between files
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'https://github.com/gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
call plug#end()

nmap <c-a>  <Plug>(altr-forward)
nmap <c-A> <Plug>(altr-back)

" css color
let g:cssColorVimDoNotMessMyUpdatetime = 1

" html generalasa
let g:user_emmet_leader_key=','

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTre.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-f> :NERDTreeToggle<CR>e

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme tokyonight
" hatter opacity allitasara
 hi Normal guibg=NONE ctermbg=NONE
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",
  highlight = {
        enable = true,
      }
  }
EOF

