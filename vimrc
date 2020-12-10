" Vic Vimmer plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => My plugins are managed by vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Language server plugin
Plug 'dense-analysis/ale'

" Autocompletion plugin 
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Plugins for git
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'

" Plugins for my stack
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'vue', 'html'] }
Plug 'ap/vim-css-color', { 'for': ['css', 'scss' ,'vue', 'html'] }
Plug 'posva/vim-vue', { 'for': ['vue' ]}
Plug 'sekel/vim-vue-syntastic', { 'for': ['vue' ]}
Plug 'digitaltoad/vim-pug', {'for': ['pug', 'vue', 'javascript', 'typescript']}
Plug 'quramy/tsuquyomi', { 'for': ['typescript', 'pug', 'vue'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'svelte', 'vue' ]}
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'burner/vim-svelte'

" Utility plugins
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
Plug 'bronson/vim-trailing-whitespace', { 'for': ['html', 'css', 'scss', 'typescript', 'javascript', 'cpp', 'java', 'c', 'cs', 'vue' , 'pug']}
Plug 'itchyny/vim-cursorword'
Plug 'thaerkh/vim-indentguides', { 'for': ['html', 'typescript', 'javascript', 'vue' ]}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }, {'for': 'html'}
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'scrooloose/syntastic', { 'for': ['vim', 'scss', 'typescript', 'javascript', 'vue' ]}
Plug 'tpope/vim-surround'

" I do not use these plugins so much

" Plug 'oranget/vim-csharp', { 'for': 'cs' }
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'nvie/vim-flake8', {'for': 'python'}
" Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
" Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
" Plug 'junegunn/limelight.vim', { 'for': ['html', 'txt', 'md' ]}
" Plug 'junegunn/goyo.vim', { 'for': ['html', 'txt', 'md' ]}
" Plug 'majutsushi/tagbar'
"
" Initialize plugin system
call plug#end()
" end of plugin system


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim plug will automatically include missing plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter *
  \| if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall | q
  \| endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim airline settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop=1
let g:airline_refresh=1
let g:airline_theme = 'arduin'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim rainbow config settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim rainbow to load when a file opens
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim autopairs config settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable fly mode for vim autopairs
let g:AutoPairsFlyMode = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => configuration for goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => configuration for ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale will autoimport missing files
" let g:ale_completion_tsserver_autoimport = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" For JavaScript files, use `eslint` (and only eslint)
let b:ale_fixers = ['eslint']

" ale fix file son save
" let g:ale_fix_on_save = 1

" Only run linters named in ale_linters settings.
" let g:ale_linters_explicit = 1

" keeping the sign column on all the time
" let g:ale_sign_column_always = 1

" ale ways of displaying errors
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => configuration for syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => configuration for trailing whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:extra_whitespace_ignored_filetypes = ['unite', 'mkd']
" to remove trailing whitespace type :FixTrailingSpace

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => configuration for commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_cpp = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'cpp': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" Deoplete will autocomplete php
call deoplete#custom#option('ignore_sources', {'php': ['omni']})

if executable('intelephense')
  augroup LspPHPIntelephense
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif

" Configuration for vim vue
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'

    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" So as to have syntax highlighting for prepocessors in vue
let g:vue_pre_processors = ['pug', 'scss', 'typescript']
let g:vue_pre_processors = 'detect_on_enter'

" " Enable auto formatting of files that have "@format" or "@prettier" tag
" let g:prettier#autoformat = 1
"
" " Allow auto formatting for files without "@format" or "@prettier" tag
" let g:prettier#autoformat_require_pragma = 0
"
" configuration for nerd tree
let NERDTreeNodeDelimiter="\x07"     "bell
let NERDTreeNodeDelimiter="\u00b7"   "middle dot
let NERDTreeNodeDelimiter="\u00a0"   "non-breaking space
let NERDTreeNodeDelimiter="😀"       "smiley face

let NERDTreeDirArrowExpandable=">"
let NERDTreeDirArrowCollapsible="v"

let NERDTreeAutoDeleteBuffer=1
let NERDTreeCascadeOpenSingleChildDir=1
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=1
" This will always open up nerdtree when eveer I open up a file
autocmd vimenter * NERDTree
" This will close nerd tree if now file is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" editor config

" Indent file depending on the type of the file
filetype plugin indent on

" set not compatible to vim
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => For vim omnicompletion to work
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set omnifunc=syntaxcomplete#Complete

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command line editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=200
set wildmenu
set wildmode=full

" A buffer becomes hidden when it is abandoned
set hid

set textwidth=60

set numberwidth=5

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set tm=500

" Linebreak on 500 characters
set lbr
set tw=400

" Auto indent
set ai

" Smart indent
set si

" C indent
set ci

" Wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim folds and comments
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
set foldenable
set foldmethod=manual

" number is relative number
set number relativenumber

" selecting a colorscheme 
colorscheme solarized8_dark_low

" the cursor to move fast
set ttyfast
set timeout timeoutlen=200 ttimeoutlen=100

"Save on buffer switch
set autowrite

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabs and indenting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" number of spaces to use for autoindenting
set shiftwidth=2
set tabstop=2

" copy the previous indentation on autoindenting
set copyindent

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" ignore case when searching
set ignorecase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => command line editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show (partial) command in the status line
set showcmd

" always show what mode we're currently editing in
set showmode
set cmdheight=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim to return to where it was before leaving the file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => managing windows and vim positioning stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For splits to be below and to the right
set splitbelow
set splitright

" http://damien.lespiau.name/blog/2009/03/18/per-project-vimrc/comment-page-1/
" set exrc " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files

" Force some file types to be other file types
au BufRead,BufNewFile *.ejs,*.mustache setfiletype html
au BufRead,BufNewFile *.json setfiletype json
au BufRead,BufNewFile *.json.* setfiletype json

if has('mouse')
  set mouse=a
endif

" Fix Vim's ridiculous line wrapping model
set ww=<,>,[,],h,l

" This is handled by airline
set noshowmode

set emoji
set magic
set icm=nosplit

set showbreak=>\ \ 

set scrolloff=15
set noshowmode

set wildmenu
set wildmode=full

set gdefault

set timeout
set timeoutlen=1000
set ttimeoutlen=100

" undo files
set undofile
set backup
set swapfile

set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

set modifiable

set nocursorcolumn
set nocursorline

" useful remaps

" setting my leader key to space
let mapleader = ' '

" launch nerdtree 
nnoremap <leader>t :NERDTree<Cr>

" run prettier 
nnoremap <leader>p :Prettier<Cr>

" enable syntax with leader ss
nnoremap <leader>ss :syntax on<Cr>

" set paste with leader sp
nnoremap <leader>sp :set paste<Cr>

" set mouse active
nnoremap <leader>ma :set mouse=a<Cr>

" set mouse inactive
nnoremap <leader>mc :set mouse=c<Cr>

" save a file with leader w
nnoremap <leader>w :w<Cr>

" quit a file wht leader q
nnoremap <leader>q :q<Cr>

" add semicolon to the end of a line
nnoremap <leader>; A;<Esc>0

" add comma to the end of a line
nnoremap <leader>, A,<Esc>0

nnoremap <leader>h1 yypVr=o
nnoremap <leader>h2 yypVr-o

" Ctr" l+j/k to move lines
nnoremap <leader><Up> ddkP
nnoremap <leader><Down> ddp
vnoremap <leader><Up> <ESC>ddkPv
vnoremap <leader><Down> <ESC>ddpv

" switching between tabs
map <leader>l <esc>:bn<Cr>
map <leader>h <esc>:bp<Cr>

" swithcing between window spilts
nnoremap <C-h> <c-w>h
nnoremap <C-l> <c-w>l

if has('nvim')
  tnoremap <C-h> <c-\><c-n><c-w>h
  tnoremap <C-l> <c-\><c-n><c-w>l
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

nnoremap Y y$
nnoremap <tab> >>
nnoremap <s-tab> >>

" Easy escaping to normal model
imap jj <esc>
imap jk <esc>

" Down is really the next line
nnoremap j gj
nnoremap k gk

nnoremap 0 g0
nnoremap $ g$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  better scrolling with ctrl j and ctrl k
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-k> <C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y><C-y>
map <C-j> <C-m><C-m><C-m><C-m><C-m><C-m><C-m><C-m><C-m><C-m><C-m><C-m><C-m>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => disabling arrow keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" visual mode
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

" normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" > will indent to the left
" < will indent to the right
vnoremap < <gv
vnoremap > >gv

" make Q useless
nnoremap Q <Nop>
nnoremap q <Nop>

" Allow cursor movements during insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Useful shortcuts
iabbr email, vmwangi550@gmail.com
iabbr ael, addEventListener

" fix typos in command line mode
cnoremap weq wq
cnoremap Tabe tabe
cnoremap R r
cnoremap Weq wq
cnoremap Wq wq
cnoremap Q q
cnoremap W w

set completeopt=menuone,longest,preview

" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> p
vmap <C-c> y

" lazy ':'
nnoremap ; :

" terminal modes settings
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" creating a new line and secaping back to normal mode
nnoremap <Cr> o<ESC>
nnoremap O O<ESC>

nnoremap <leader>n <C-w>w

" use z as the . operator
nnoremap z .

" return external commands inside vim
cnoremap ls !ls
cnoremap la !la
cnoremap ll !ll
cnoremap pwd !pwd

" spells and typos

set encoding=UTF-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => incase I need vim to spellcheck
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set dictionary
" set spelllang=en_us
" set spell
" set spellsuggest=best

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fixing typos and shortcuts while typing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fixing typos
iabbr colro color
iabbr teh the
iabbr ture true
iabbr flase false
iabbr warnign warning
iabbr tow two
iabbr fiel file
iabbr lenght length
iabbr bets best
iabbr Bets Best
iabbr ma am
iabbr Iam I am
iabbr Im I'm
iabbr TEh The
iabbr THat That
iabbr THe The
iabbr Teh The
iabbr Theyare They are
iabbr Youre You're
iabbr abotu about
iabbr aboutit about it
iabbr acn can
iabbr adn and
iabbr aer are
iabbr agian again
iabbr ahev have
iabbr ahve have
iabbr alos also
iabbr alot a lot
iabbr alse else
iabbr alsot also
iabbr amde made
iabbr amke make
iabbr amkes makes
iabbr anbd and
iabbr andd and
iabbr anf and
iabbr ans and
iabbr aobut about
iabbr aslo also
iabbr asthe as the
iabbr atthe at the
iabbr awya away
iabbr aywa away
iabbr bakc back
iabbr baout about
iabbr bcak back
iabbr beacuse because
iabbr becuase because
iabbr bve be
iabbr cant can't
iabbr chaneg change
iabbr chanegs changes
iabbr chekc check
iabbr chnage change
iabbr chnaged changed
iabbr chnages changes
iabbr claer clear
iabbr cmo com
iabbr cna can
iabbr coudl could
iabbr cpoy copy
iabbr dael deal
iabbr didnot did not
iabbr didnt didn't
iabbr diea idea
iabbr doens does
iabbr doese does
iabbr doesnt doesn't
iabbr doign doing
iabbr doimg doing
iabbr donig doing
iabbr dont don't
iabbr eahc each
iabbr efel feel
iabbr ehlp help
iabbr ehr her
iabbr emial email
iabbr ened need
iabbr enxt next
iabbr esle else
iabbr ew we
iabbr eyar year
iabbr eyt yet
iabbr fatc fact
iabbr fidn find
iabbr fiel file
iabbr firts first
iabbr flase false
iabbr fo of
iabbr fomr form
iabbr fora for a
iabbr forthe for the
iabbr foudn found
iabbr frmo from
iabbr fro for
iabbr frome from
iabbr fromthe from the
iabbr fwe few
iabbr gerat great
iabbr gievn given
iabbr goign going
iabbr gonig going
iabbr gruop group
iabbr grwo grow
iabbr haev have
iabbr hasa has a
iabbr havea have a
iabbr hda had
iabbr hge he
iabbr hlep help
iabbr holf hold
iabbr hsa has
iabbr hsi his
iabbr htan than
iabbr htat that
iabbr hte the
iabbr htem them
iabbr hten then
iabbr htere there
iabbr htese these
iabbr htey they
iabbr hting thing
iabbr htink think
iabbr htis this
iabbr hvae have
iabbr hvaing having
iabbr hvea have
iabbr hwich which
iabbr hwo how
iabbr idae idea
iabbr idaes ideas
iabbr ihs his
iabbr ina in a
iabbr inot into
iabbr inteh in the
iabbr inthe in the
iabbr inthese in these
iabbr inthis in this
iabbr inwhich in which
iabbr isthe is the
iabbr isze size
iabbr itis it is
iabbr itwas it was
iabbr iused used
iabbr iwll will
iabbr iwth with
iabbr jstu just
iabbr jsut just
iabbr knwo know
iabbr knwon known
iabbr knwos knows
iabbr konw know
iabbr konwn known
iabbr konws knows
iabbr kwno know
iabbr laod load
iabbr lastr last
iabbr layed laid
iabbr liek like
iabbr liekd liked
iabbr liev live
iabbr likly likely
iabbr ling long
iabbr liuke like
iabbr loev love
iabbr lsat last
iabbr lveo love
iabbr lvoe love
iabbr mcuh much
iabbr mear mere
iabbr mial mail
iabbr mkae make
iabbr mkaes makes
iabbr mkea make
iabbr moeny money
iabbr mroe more
iabbr msut must
iabbr muhc much
iabbr muts must
iabbr mysefl myself
iabbr myu my
iabbr nad and
iabbr niether neither
iabbr nkow know
iabbr nkwo know
iabbr nmae name
iabbr nowe now
iabbr nto not
iabbr nver never
iabbr nwe new
iabbr nwo now
iabbr ocur occur
iabbr ofa of a
iabbr ofits of its
iabbr ofthe of the
iabbr oging going
iabbr ohter other
iabbr omre more
iabbr oneof one of
iabbr onthe on the
iabbr onyl only
iabbr ot to
iabbr otehr other
iabbr otu out
iabbr outof out of
iabbr owrk work
iabbr owuld would
iabbr paide paid
iabbr peice piece
iabbr puhs push
iabbr pwoer power
iabbr rela real
iabbr rulle rule
iabbr rwite write
iabbr sasy says
iabbr seh she
iabbr shoudl should
iabbr sitll still
iabbr sleect select
iabbr smae same
iabbr smoe some
iabbr sned send
iabbr soem some
iabbr sohw show
iabbr soze size
iabbr stnad stand
iabbr stpo stop
iabbr syas says
iabbr ta at
iabbr tahn than
iabbr taht that
iabbr tath that
iabbr teh the
iabbr tehir their
iabbr tehn then
iabbr tehre there
iabbr tehy they
iabbr tghe the
iabbr tghis this
iabbr thanit than it
iabbr thansk thanks
iabbr thast that
iabbr thats that's
iabbr thatthe that the
iabbr theh then
iabbr theri their
iabbr theyare they are
iabbr thgat that
iabbr thge the
iabbr thier their
iabbr thign thing
iabbr thme them
iabbr thn then
iabbr thna than
iabbr thne then
iabbr thnig thing
iabbr thre there
iabbr thsi this
iabbr thsoe those
iabbr thta that
iabbr thyat that
iabbr thye they
iabbr ti it
iabbr tiem time
iabbr tihs this
iabbr timne time
iabbr tiome time
iabbr tje the
iabbr tjhe the
iabbr tkae take
iabbr tkaes takes
iabbr tkaing taking
iabbr todya today
iabbr tothe to the
iabbr towrad toward
iabbr tthe the
iabbr ture true
iabbr twpo two
iabbr tyhat that
iabbr tyhe the
iabbr tyhe they
iabbr uise use
iabbr untill until
iabbr veyr very
iabbr vrey very
iabbr waht what
iabbr wass was
iabbr watn want
iabbr weas was
iabbr wehn when
iabbr werre were
iabbr whcih which
iabbr wherre where
iabbr whic which
iabbr whihc which
iabbr whn when
iabbr whta what
iabbr wih with
iabbr wihch which
iabbr wiht with
iabbr willbe will be
iabbr willk will
iabbr witha with a
iabbr withe with
iabbr withh with
iabbr withit with it
iabbr witht with
iabbr withthe with the
iabbr witn with
iabbr wiull will
iabbr wnat want
iabbr wnats wants
iabbr woh who
iabbr wohle whole
iabbr wokr work
iabbr woudl would
iabbr wrod word
iabbr wroet wrote
iabbr wrok work
iabbr wtih with
iabbr wuould would
iabbr wya way
iabbr yaer year
iabbr yera year
iabbr yoiu you
iabbr yoru your
iabbr youare you are
iabbr youre you're
iabbr youve you've
iabbr yrea year
iabbr ytou you
iabbr yuo you
iabbr yuor your
