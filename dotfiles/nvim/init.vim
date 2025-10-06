set nocompatible
let mapleader=','

filetype off

" Ensure vim-plug is installed
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start plugin section
call plug#begin()

" --- PLUGINS ---
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'loctvl842/monokai-pro.nvim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ggandor/leap.nvim'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-startify'

" End plugin section
call plug#end()

" Enable filetype plugins and syntax
filetype plugin indent on
syntax on

" --- GENERAL SETTINGS ---
set number relativenumber
set autoread
set showmatch
set clipboard^=unnamed,unnamedplus
set expandtab smarttab tabstop=4 shiftwidth=4 autoindent copyindent
set noswapfile nobackup nowb
set colorcolumn=80
hi ColorColumn ctermbg=236

" Disable arrow keys
noremap <Left> <Nop>
noremap <Right> <Nop>
map <Up> <c-y>
map <Down> <c-e>

" --- PYTHON SETTINGS ---
augroup python
    autocmd!
    autocmd BufNewFile,BufRead *.py,*.pyw set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=88 expandtab autoindent
    autocmd BufRead, BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
augroup END

" --- COLORS ---
lua << EOF
require("monokai-pro").setup({
  filter = "octagon" -- classic | octagon | pro | machine | ristretto | spectrum
})
EOF
colorscheme monokai-pro

" --- NVIM-TREE ---
lua << EOF
require("nvim-tree").setup({})
EOF
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap - :NvimTreeFindFile<CR>:wincmd p<CR>

" --- LEAP ---
lua << EOF
require("leap").create_default_mappings()
EOF

" --- TELESCOPE ---
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" --- COC CONFIG ---
set encoding=utf-8
set nobackup nowritebackup
set updatetime=300
set signcolumn=yes

if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" : "\<TAB>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

nnoremap <silent> <leader>o :call ShowDocumentation()<CR>
function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys(',o', 'in')
    endif
endfunction
nnoremap <silent> <leader>x :call coc#float#close_all()<CR>

nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jr <Plug>(coc-references)
nmap <silent> <leader>qf <Plug>(coc-fix-current)
nmap <silent> <leader>ac <Plug>(coc-codeaction-cursor)
nnoremap <leader>sd :call CocAction('diagnosticToggle')<CR>
nnoremap <leader>nd <Plug>(coc-diagnostic-next)
nnoremap <leader>pd <Plug>(coc-diagnostic-prev)

" --- MARKDOWN PREVIEW ---
nmap <C-s> <Plug>MarkdownPreview

" --- AIRLINE ---
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if has('gui_running')
  set guifont=Roboto\ Mono\ for\ Powerline
endif

" --- VIMTEX ---
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'

" --- GITGUTTER ---
highlight! link SignColumn LineNr
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_sign_allow_clobber = 1
