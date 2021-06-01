syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Basic stuff
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set bg=dark
set nu rnu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8

" Saves changes to disk (To trigger hot realoading on websites etc.)
set autoread

" No annoying sound on errors
set belloff=all
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Properly disable sound on errors on MacVim
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif


"Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Plugin Mode
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'git@github.com:ctrlpvim/ctrlp.vim.git'
Plug 'mbbill/undotree'
Plug 'dense-analysis/ale'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'chemzqm/vim-jsx-improve'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jremmen/vim-ripgrep'
Plug 'preservim/nerdcommenter'
Plug 'lifepillar/pgsql.vim'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'dart-lang/dart-vim-plugin'
Plug 'hsanson/vim-android'
Plug 'thosakwe/vim-flutter'
Plug 'ThePrimeagen/vim-be-good'
Plug 'udalov/kotlin-vim'


call plug#end()


let b:sql_type_default = 'pgsql'
let g:NERDDefaultAlign = 'left'

" Set hit status
let g:airline_theme='wombat'

packloadall

" ColorSchema
let g:dracula_italic = 0
silent! colorscheme dracula
highlight Normal ctermbg=None

let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'

" Remap leader key
let mapleader=" "

" Undo tree
nnoremap <leader>u :UndotreeShow<CR>

let b:ale_linters = ['flow-language-server']

" Or in ~/.vim/vimrc:
let g:ale_linters = {
\   'javascript': ['flow-language-server'],
\}

" Nerd tree
nnoremap <silent> <leader>pv :NERDTreeFind<CR>

" Jump back and forward
nnoremap <silent> <leader>b :e#<CR>
nnoremap <silent> <Leader>f :bn<CR>

" Move between buffers
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Split buffers
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>V :wincmd S<CR>

" Buffer management
nnoremap <leader>s :w<CR>
nnoremap <leader>x :q<CR>
nnoremap <leader>e :vs<bar>:b#<CR>

" Resize buffers
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>+ :resize +5<CR>
nnoremap <silent> <leader>_ :resize -5<CR>

" Auto close brackets etc.
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap (<CR> (<CR>)<ESC>O

" Reload vimrc in whatever folder
nnoremap <leader>rv :so ~/.vimrc<CR>

" Move styles from inline styles to stylesheet
function! Move_style_to_stylesheet() 
  let name = input('Enter style name: ')
  call feedkeys(join([ "/\\}\<CR>\%a \<ESC>da{i<+MARK+>\<ESC>/const styles\<CR>o",name,":\<CR>\<CR>\<ESC>p/\<CR>/\}\<CR>A,\<ESC>gg\/<+MARK+>\<CR>df>istyles.",name,"\<ESC>"], ''))
endfunction

nnoremap <leader>ms :call Move_style_to_stylesheet()<CR>

" CoC related stuff
" TextEdit might fail if hidden is not set.
set hidden
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nnoremap <leader>gd :call CocAction('jumpDefinition', 'drop')<CR>

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ii <Plug>(coc-fix-current)

nmap <F5> <ESC>:Gradle assembleDebug<CR>

" Set status code line for coc
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Enable Coc Prettier
autocmd FileType typescript,typescriptreact command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

nnoremap <C-h> :Rg 

let g:lsc_auto_map = v:true

