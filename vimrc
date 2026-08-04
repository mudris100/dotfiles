" Source system default behavior if present
unlet! g:skip_defaults_vim
if filereadable($VIMRUNTIME . '/defaults.vim')
  source $VIMRUNTIME/defaults.vim
endif

" Enable filetype plugins and auto-indentation FIRST
filetype plugin indent on
syntax on

set number                   " Show line numbers
set background=dark          " Ensure high-contrast syntax colors for dark terminals
colorscheme slate            " Primary default scheme

" Global Indentation Defaults (Fallback)
set expandtab                " Convert tabs to spaces
set tabstop=4                " Default to 4 spaces
set shiftwidth=4
set softtabstop=4
set autoindent

" Disable backup / swap files on remote servers
set nobackup
set nowb
set noswapfile

" ==============================================================================
" Language-Specific Indentation Overrides
" ==============================================================================
augroup FiletypeIndentation
  autocmd!

  " 2-space indentation (YAML, Ansible, JSON, HTML)
  autocmd FileType yaml,yml,raml,json,html,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

  " 4-space indentation (Bash, Python, Dockerfile)
  autocmd FileType sh,bash,python,dockerfile  setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
augroup END

" ==============================================================================
" Key Mappings & Shortcuts
" ==============================================================================
let mapleader = " "

" Space + q, Space + w
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" Navigate splits using Space + Arrows
nnoremap <silent> <leader><Up>    :wincmd k<CR>
nnoremap <silent> <leader><Down>  :wincmd j<CR>
nnoremap <silent> <leader><Left>  :wincmd h<CR>
nnoremap <silent> <leader><Right> :wincmd l<CR>

" Navigate splits using Space + h/j/k/l
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

" Switch buffers using F4
nnoremap <F4> :buffers<CR>:buffer<Space>

nnoremap <silent> <leader>c :nohlsearch<CR>

" Set the cursorline
set cursorline

" Refresh vim config with F5
noremap <silent> <F5> :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ==============================================================================
" Native File Explorer (netrw)
" ==============================================================================
let g:netrw_banner = 0          " Hide top help banner
let g:netrw_winsize = 25        " Set tree width to 25% of screen
let g:netrw_browse_split = 4    " Open files in previous window
let g:netrw_liststyle = 3       " Tree view display style

" F2: Toggle built-in file explorer sidebar
nnoremap <silent> <F2> :Lexplore<CR>

" F3: Switch to previous active buffer
nnoremap <silent> <F3> <C-^>

" ==============================================================================
" Search & Character Encoding Settings
" ==============================================================================
set ignorecase              " Ignore case when searching...
set smartcase               " ...unless query contains an uppercase letter
set hlsearch                " Highlight all search matches
set incsearch               " Highlight matches dynamically as you type

set encoding=utf-8          " Set default internal character encoding
set fileformats=unix,dos,mac " Prefer Unix line endings (\n)

" ==============================================================================
" Dynamic Color Scheme Switcher
" ==============================================================================
function! NextColorScheme(step)
  if !exists('g:colo_list')
    " Scans built-in Vim runtime paths for available *.vim schemes
    let g:colo_list = sort(map(globpath(&rtp, "colors/*.vim", 0, 1), "fnamemodify(v:val, ':t:r')"))
  endif
  if !exists('g:colo_idx')
    let g:colo_idx = index(g:colo_list, get(g:, 'colors_name', 'default'))
  endif
  let g:colo_idx = (g:colo_idx + a:step) % len(g:colo_list)
  if g:colo_idx < 0
    let g:colo_idx += len(g:colo_list)
  endif
  execute 'colorscheme ' . g:colo_list[g:colo_idx]
  echo "Colorscheme: " . g:colo_list[g:colo_idx]
endfunction

" Cycle through built-in color schemes with F8 (Next) and F9 (Previous)
nnoremap <F8> :call NextColorScheme(1)<CR>
nnoremap <F9> :call NextColorScheme(-1)<CR>

" ==============================================================================
" Status Line Configuration
" ==============================================================================
set laststatus=2
autocmd ColorScheme * redrawstatus!
set statusline=%t\ %m%r\ %=%y\ %{exists('g:colors_name')?g:colors_name:'default'}\ [%l:%c]

