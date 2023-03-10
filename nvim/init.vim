""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Managing Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'mxw/vim-jsx'
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomasiser/vim-code-dark'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'bewakes/vim-rest-client'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Configuring CoC                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-explorer',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-rust-analyzer'
  \ ]

set clipboard+=unnamedplus
set encoding=UTF-8
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set relativenumber
set number
set smarttab
set cindent
set tabstop=4
set shiftwidth=2
set expandtab
set hidden 
set updatetime=300
set shortmess+=c
set signcolumn=yes
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
colorscheme codedark

" Variables
let g:airline#extensions#tabline#enabled = 1
"let g:javascript_plugin_jsdoc = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = ","
let g:mapleader = ","

" Remaps
inoremap jk <ESC>
nmap <space>e :CocCommand explorer<CR>
vmap cc <plug>NERDCommenterToggle
nmap cc <plug>NERDCommenterToggle
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Clipboard yank & del
vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
" Remaps for coc.nvim stuffs 
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Custom functions
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Custom Commands
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
