" Generic settings
set encoding=utf-8         " utf-8 is the shiznitz
set guioptions=cem         " use the console for confirmation dialogues + display the tab bar in the gui + show the menu bar
set hidden                 " allow hiding buffers with unsaved changes when navigating the buffer list
set laststatus=2           " always show the status bar
set nobackup               " use _other_ means as backup than *.orig files
set nocompatible           " don't care about vi
set noswapfile             " swap files - good if you're editing large files on a daily basis maybe, but i'm not...
set number                 " everyone loves row numbers
set ruler                  " show information about current row/col
set showcmd                " show useful information about the current state of keyboard input in normal mode
set showtabline=2          " always show the tab bar
set scrolloff=3            " Keep some context around the current line when scrolling

" Enable syntax highlighting depending on file type
syntax on

" Whitespacing and line/row breaks
set tabstop=2                                       " a tab is two spaces...
set softtabstop=2                                   " ...and the corresponding backspace removes the same amount of space
set shiftwidth=2                                    " indentation should follow tabstop, or stuff will have different indentation
set expandtab                                       " expand tabs into spaces
set wrap                                            " let's wrap by default
set linebreak                                       " break on word barriers
set listchars=tab:»·,trail:·,precedes:<,extends:>   " highlight these little bastard when 'set list' is invoked
set backspace=indent,eol,start                      " backspace through everything in insert mode

" Search customizations
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Share the clipboard contents with Mac OS X
set clipboard=unnamed

" Expand '%%' in command mode to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Tab completion behavior when opening files
set wildmode=list:longest,list:full  " complete as much as possible, then full for each press on tab

" Toggle hilighting of the last search
map <silent> <C-L> :set hlsearch!<CR>

" Toggle display of invisible characters
map <silent> <leader>s :set nolist!<CR>

" When moving around using j/k, jump _within_ wrapped lines too (since you probably don't want to skip an entire paragraph).
nnoremap j gj
nnoremap k gk

" Tell vim to look for tags in parent directories, according to...
" http://stackoverflow.com/questions/5017500/vim-difficulty-setting-up-ctags-source-in-subdirectories-dont-see-tags-file-i
set tags=tags;/

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Allow saving of files as sudo when you forget to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Setup vundle
filetype off                                  " Required
set rtp+=~/.vim/bundle/Vundle.vim/            " Make sure to clone vundle.git here first
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'Tabular'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'       " For airline colorscheme solarized
Plugin 'altercation/vim-colors-solarized'     " For colorscheme solarized
Plugin 'bitc/vim-bad-whitespace'
Plugin 'commentary.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'taglist.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'plasticboy/vim-markdown'

" Vundle setup complete, reset filetype
call vundle#end()
filetype plugin indent on

if has("autocmd")
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab nowrap
  autocmd FileType c,cpp,objc setlocal ts=2 sts=2 sw=2 expandtab nowrap
endif

" Load matchit, which expands the functionality of the '%' command
runtime macros/matchit.vim

" Use the solarized color scheme
set background=dark
let g:solarized_termcolors=256  " Fancy fallback so that you don't have to change your terminal's color scheme
colorscheme solarized

" Configure ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode --dir'                        " Remember the last mode _and_ original directory instead of defaulting to some specific mode
let g:ctrlp_extensions = ['line', 'dir', 'buffertag', 'tag']   " Enable extensions
let g:ctrlp_by_filename = 1                                    " Search by filename only by default (toggle with <c-d>)

" Configure airline
let g:airline_theme='solarized'
let g:airline_section_c = '%F'

" Configure markdown
let g:vim_markdown_folding_disabled = 1

" Set the default font for vim GUIs
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h10