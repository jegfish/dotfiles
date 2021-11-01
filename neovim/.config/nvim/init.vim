call plug#begin(stdpath('data') . '/plugged')

Plug 'SirVer/ultisnips'

Plug 'https://github.com/vimwiki/vimwiki'
Plug 'junegunn/fzf' " necessary for vim-zettel
Plug 'junegunn/fzf.vim' " necessary for vim-zettel
Plug 'https://github.com/michal-h21/vim-zettel'

Plug 'https://github.com/tpope/vim-commentary'

" colorschemes
Plug 'https://github.com/tomasiser/vim-code-dark'

call plug#end()

let mapleader = " "

"set autoindent
"set smartindent
colorscheme codedark
set number relativenumber

set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

set autoread
set autowrite

" https://stackoverflow.com/a/61382706
let g:is_posix = 1

" https://dev.to/waylonwalker/live-substitution-in-neovim-5e34
set inccommand=nosplit

""" Section: Vimwiki
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'syntax': 'markdown',
	\ 'ext': '.md'}]
" https://github.com/vimwiki/vimwiki/pull/529
let g:vimwiki_markdown_link_ext = 1
" Automatically insert current date when opening Vimwiki diary
nmap <Leader>w<Leader>w <Plug>VimwikiMakeDiaryNote Go<Esc>0D:read!date +"\%Y-\%m-\%dT\%H:\%M \%A"<CR>0i# <Esc>o

""" Section: UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
" disable Vimwiki table mappings so Tab is avaialbe for UltiSnips
" https://github.com/vimwiki/vimwiki/issues/1021#issuecomment-712554493
let g:vimwiki_key_mappings = {}
let g:vimwiki_key_mappings.table_mappings = 0
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/jgf-snippets']

nnoremap gb :ls<CR>:b<Space>

" In order to work needs to be called after *something*, don't know what.
" So I'll just put it near the bottom.
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" Section: Filetype settings
autocmd FileType vimwiki setlocal tw=80
