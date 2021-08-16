"Plugins

call plug#begin('$HOME/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'diepm/vim-rest-console'
Plug 'digitaltoad/vim-pug'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
call plug#end()

"GitGuttter configuration
let g:gitgutter_set_sign_backgrounds=0

"NERDTree configuration
let NERDTreeHighlightCursorline=0
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalMenu=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=45
let NERDTreeCascadeSingleChildDir=1
let NERDTreeIgnore=['\~$', '\.git', 'node_modules', 'vendor']
let NERDTreeDirArrowCollapsible="-"
let NERDTreeDirArrowExpandable="+"

autocmd FileType nerdtree setlocal relativenumber

"Vim Airline Clock configuration
let g:airline#extensions#clock#updatetime = 1000
let g:airline#extensions#clock#format = '%H:%M:%S'

"FZF configuration
let g:fzf_preview_window = []
let g:fzf_layout= {'window':{'width': 0.5, 'height': 0.5, 'border': 'sharp'}}
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'Normal', 'Normal'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Comment'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

"CocConfiguration
let g:coc_global_extensions=[
			\ 'coc-json',
			\ 'coc-tsserver',
			\ 'coc-html',
			\ 'coc-yaml',
			\ 'coc-css',
			\ 'coc-emmet',
			\ 'coc-xml',
			\ 'coc-java',
			\ 'coc-phpls',
			\ 'coc-sh',
			\ 'coc-prettier',
			\ 'coc-go',
			\ 'coc-snippets'
			\]

"VRC options
let g:vrc_response_default_content_type = 'application/json'
let g:vrc_syntax_highlight_response = 0
let g:vrc_auto_format_response_patterns = {
	\ 'json': 'jq -M --tab "."',
	\ 'xml': 'xmllint --format -',
	\}
let g:vrc_curl_opts = {
  \ '--silent': '',
  \ '--include': '',
  \ '-H': ['Accept: application/json', 'Content-type: application/json'],
\}

"Maps

nnoremap <silent><leader>fg :GFiles<CR>
nnoremap <silent><leader>fb :Buffers<CR>
nnoremap <silent><leader>fr :Rg<CR>
nnoremap <silent><leader>ff :Files <CR>
nnoremap <silent><leader>fl :BLines <CR>
nnoremap <silent><leader>fw :Windows <CR>

nnoremap <silent> <leader>t :NERDTreeToggle<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
		elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " .
		expand('<cword>')
		endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <silent><expr> <c-j> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<TAB>'

nmap <leader>cr <Plug>(coc-rename)
nmap <leader>cf <Plug>(coc-format)
xmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cp <Plug>(coc-diagnostic-prev)
nmap <leader>cn <Plug>(coc-diagnostic-next)
nmap <leader>ci <Plug>(coc-implementation)
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>cl <Plug>(coc-codeaction-line)
nmap <leader>cq <Plug>(coc-fix-current)
nmap <leader>cce :CocEnable <CR>
nmap <leader>ccd :CocDisable <CR>
nmap <leader>ccr :CocRestart <CR>

"Sets
set nocompatible
set number
set relativenumber
set nowrap
set noshowmode
set autoindent
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldmethod=marker
set ignorecase
set smartcase
set incsearch
set wildmenu
set wildignore+=**/node_modules/**
set path+=**
set hidden
set noswapfile
set undodir=~/.vim/undodir
set undofile
set nobackup
set noshowmatch
set updatetime=200
set background=dark
set t_Co=16
set fillchars+=vert:\ "
set signcolumn=number

highlight SignColumn ctermbg=NONE
highlight Pmenu ctermfg=7 ctermbg=0
highlight PmenuSel ctermfg=15 ctermbg=8
highlight VertSplit ctermfg=0 ctermbg=0
highlight StatusLine ctermfg=0 ctermbg=15
highlight StatusLineNC ctermfg=0 ctermbg=8
highlight StatusLineTerm ctermfg=15 ctermbg=0
highlight StatusLineTermNC ctermfg=8 ctermbg=0
highlight TabLine ctermfg=8 ctermbg=0
highlight TabLineSel ctermfg=15 ctermbg=0
highlight TablineFill ctermfg=0 ctermbg=0
highlight Search ctermfg=9 ctermbg=8
highlight IncSearch ctermfg=6 ctermbg=0
highlight MatchParen ctermbg=8NONE

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"Cmds

autocmd BufWrite *.php set expandtab | retab | set noexpandtab

