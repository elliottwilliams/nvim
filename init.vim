set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')

" Feature plugins, ordered in order of importance to me
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'tpope/vim-fugitive'
Plug 'tacahiroy/ctrlp-funky'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'vim-airline/vim-airline'
Plug 'jlanzarotta/bufexplorer'
Plug 'mileszs/ack.vim'
"Plug 'airblade/vim-gitgutter'
Plug 'wesQ3/vim-windowswap'
Plug 'Yggdroot/indentLine'    " use :IndentLinesToggle
Plug 'wakatime/vim-wakatime'
Plug 'junegunn/vim-easy-align'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'gfontenot/vim-xcode'


" Style plugins
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'reedes/vim-colors-pencil'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }

" Syntax-specific plugins
Plug 'lervag/vim-latex'
Plug 'groenewege/vim-less'
Plug 'vim-scripts/mako.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'AndrewRadev/vim-eco'
Plug 'keith/swift.vim'
Plug 'vim-scripts/pydoc.vim'
"Plug 'landaire/deoplete-swift'
Plug 'mitsuse/autocomplete-swift'

" Initialize plugin system
call plug#end()

" General settings
set rnu                     " relative line numbering
syntax enable               " syntax highlighting
set nowrap                  " disable wrap
set mouse=a                 " enable mouse mode
set foldmethod=indent       " fold anything predictably
set foldlevelstart=20       " auto-unfold up to 20 level of folds
set hidden                  " allows buffers to be hidden w/o writing changes
let g:mapleader=","         " it's better mapped to here
set encoding=utf-8          " vim defaults to $LANG or latin1
set splitright              " open vsplits to the right, by default
set exrc                    " look for config files in current directory
set clipboard=unnamed       " use system clipboard

" Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent

" make backspace do the right thing
set backspace=indent,eol,start

" clear highlights easily
nnoremap <leader>n :noh<CR>

" search
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch

" make space highlight all occurances of word under cursor
nmap <space> *N

" fast buffer switching 
nmap <Tab>   :bn<CR>
nmap <S-Tab> :bp<CR>
nnoremap <leader>l :e#<CR>
nnoremap <leader>q :Bclose<CR>
nnoremap <leader>m :CtrlPBuffer<CR>

" choose buffer easily from buffers menu
nmap <F5> :BufExplorer<CR>
nmap <F6> :CtrlPBuffer<CR>

" close windows easily
nnoremap <leader>c :close<CR>
nnoremap <leader>C :Bclose<CR> :close<CR>

" appearance
highlight clear SignColumn 
if has("gui_running")
  set guifont=AnonymousPro:h15
  set guioptions=gm
endif
set background=light
colors tomorrow

" tagbar setup 
map <F8> :TagbarToggle<CR>
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1

" NERDTree setup
map <F7> :NERDTreeFocus<CR>
let NERDTreeIgnore=['\.pyc']
let NERDTreeWinSize=40
autocmd FileType nerdtree set relativenumber

" tags
set tags=tags;/ " will search for 'tags' file from current directory to /
nnoremap <c-]> g<c-]>   " swap tag jump commands to show a menu on multiple tags
vnoremap <c-]> g<c-]>
" g + c-] will jump to the tag (prompting for selection if necessary) in a
" vsplit to the right of the current window
nnoremap g<c-]> :rightbelow vert stjump <c-r><c-w><cr>
vnoremap g<c-]> :rightbelow vert stjump <c-r><c-w><cr>

" ctrlp config -- file finder
let g:ctrlp_max_files = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 100 " try to reduce lagginess in ym

" ctrlp tag switching (use the same ctrlp shortcut, but leader first)
nnoremap <leader><c-p> :CtrlPTag<CR>
vnoremap <leader><c-p> :CtrlPTag<CR>

" ctrlp-funky function jump
nnoremap <leader>j :CtrlPFunky<CR>

" ignore files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" column ruler: highlights the character that goes past the 80th column.
set colorcolumn=81
set winwidth=87
set tw=79
set formatoptions+=t

" when opening things, after plugins mess with formatoptions, set ours
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

" vim-airline statusline configuration
let g:airline_powerline_fonts = 0
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'pencil'

" disable airline plugins that are slow
let g:airline#extensions#tagbar#enabled = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

let g:syntastic_python_checkers = ['pep8']
let g:syntastic_python_pep8_args = ['--ignore=E501']

" tabline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_nr_show = 0

" gitgutter config - prevent it from lagging vim on buffer switch
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" ack lookup -- don't <cr> on these so that I can adjust the command before
" running
nnoremap <leader>k  :!ack '<c-r><c-w>'<left>
vnoremap <leader>k  :!ack '<c-r><c-w>'<left>

" filetype recognition
au BufRead,BufNewFile *.kit setfiletype html
au BufNewFile,BufRead *.mako setlocal syntax=mako
let g:tex_flavor = "latex"  " default to latex filetype

" replace builtin man page lookup with :Vman, which will open the man page in a
" vertical split. move the cursor back before the word, and position it so that
" the section number can be added in a single keystroke.
nmap K  :Vman <c-r><c-w><s-left><left><space>
vmap K  :Vman <c-r><c-w><s-left><left><space>

" disable tablines by default
let g:indentLine_enabled = 0

" EasyAlign mappings
" start in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" start on a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" deoplete (keyword completion) settings
let g:deoplete#enable_at_startup = 1

" use vim-dispatch to run xcodebuild commands
let g:xcode_runner_command = ':Start! {cmd}\'
