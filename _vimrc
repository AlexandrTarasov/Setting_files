set number
set relativenumber
set guioptions -=T
set go -=m
set go -=i
set expandtab
set ghr=0
set noerrorbells
set noequalalways
set tabstop=4
" set guifont=Monospace\ 18px
set guifont=Consolas:h16
set linespace=1
filetype plugin on " plugins are enabled
set hlsearch
set incsearch
set encoding=UTF-8
set splitright
" set splitbelow
syntax on
set listchars=eol:¬,trail:·,extends:>,precedes:<,space:-,tab:↓-
" set list! "show unprintable symbols
set nolist
set mps+=<:>
set showmatch
set confirm
" set title "name of current buffer
set spelllang=en_us
set spell
"to check spelling push z= buttons
set smartindent
set shiftwidth=4
"set copyindent
set autoindent 
set wrap
set linebreak
set autowriteall "auto write file when buffer switched 
set nocp
" Smoother changes
set ttyfast
set cursorcolumn
" set dictionary+=/usr/share/dict/func
set noswapfile
set nobackup
set directory=/tmp
set completeopt=noinsert,menuone
set guioptions-=e
"make vim understend aliased from bush
" set laststatus=2
" set t_Co=256
set cole=3 " Concealed text is completely hidden
color wwdc16

au ExitPre * mkview
au BufWinEnter * if expand('%:p') != '' | silent loadview | endif
" Emoji shortcuts
ab :white_check_mark: ✅
ab :warning: ⚠
ab :bulb: 💡
ab :pushpin: 📌
ab :pencil: 📝
ab :point_right: 👉
ab :book: 📖
ab :link: 🔗
ab :wrench: 🔧
ab :paper: 📃

winpos -0 -0
winsize 1000 900
hi vertsplit guifg=bg guibg=black

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" set bg=light "set light for gruvbox

if exists('+colorcolumn')
 set colorcolumn=80
endif
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  " execute 'winpos 1 0'
    set lines=30 co=40
endif

if getcwd() == "/home/alex/Storage/0-Studying/English/words-phrases"
	execute "winpos 0 0"
	execute "set co=150"
	" execute "colorscheme wwdc17"
	" execute "so Session.vim"
endif
if getcwd() == "/home/alex"
    autocmd VimEnter * :NERDTreeToggle
	execute "normal! \<S-b>"
endif

"---functions

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'v'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
"
"
function! AdjustFontSize(amount)
  if has("gui") 
    let font_data_list = split(&guifont)
	let font_data_list[1] = substitute(font_data_list[1], 'px', '', '')
	if (a:amount == 2)
		let font_data_list[1] = font_data_list[1] + 2
		execute ":set co=999"
		execute ":set lines=999"
	else
		let font_data_list[1] = font_data_list[1] - 2
		execute ":set co=999"
		execute ":set lines=999"
	endif
	let newfont = join(font_data_list, " ")
	let newfont = newfont . "px"
    let &guifont = newfont
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

"-- statuslineconfit
set statusline=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=%#todo#                    " swithc to todo highlight
set statusline+=\♦%f                           " file name
" set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor    
"
                        
"no background  in  the terminal vim
hi Normal ctermbg=NONE  
hi Comment guifg=gray30 
hi Search guibg=red guifg=black
hi SpecialKey ctermfg=darkblue

"---mapping
nmap <Leader><Leader><Leader> :!poweroff<cr>
vmap <C-c> "+y
vmap <C-v> "+gp
imap <C-v> <Esc>"+gp
"+gp doesn't work because C-v does make block visual mode
nmap ev :tabedit $MYVIMRC <CR>
nmap ed :w <CR> :source $MYVIMRC<CR>
nmap i3conf :tabedit $HOME/.config/i3/config<CR>

"close go next right and close left one.
nmap <Leader>1 <C-w>l:q<CR> 
nmap <Leader>[ :set co-=35<CR>
nmap <Leader>] :set co+=35<CR>
imap ,, <Esc>
vmap ,, <Esc>

"buffer only
vmap <F12> <C-c>j<S-$>v<S-^><F2><S-v>zz
vmap ,' d<Esc>i'<Esc>pe
vmap ," d<Esc>i"<C-c>pe


"go to the end and put the period.
imap ,e <Esc><S-a>.<Esc>
imap <Leader>ec <Esc><S-a>echo"</br>";<Esc>

"change current dir to opened file dir
nmap ,ccd :cd %:p:h<CR><CR>

"fined next appearance of //
imap ,f <Esc>/\/\/<CR>vlc

" go to end of line in insert mode.
imap ,ge <Esc><S-a>

"save buffer
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

" (wrapping) words
imap ,w (<Esc>lx$phxph<S-%>a
nmap ,w ciw(<Esc>pl
"wrap a line of the text in curly braces
vmap ,] <S-c>{}<Esc>i<Cr><Esc>pkdd 
vmap ,) <S-c>()<Esc>i<Cr><Esc>pkdd 
"wrap within an asterisk for mainPart
nmap <F3> viws*<Esc>pa*<Esc>
vmap <F4> s\|<Esc>pa\|<Esc>


" nmap <Leader>z xh/<C-R>-<CR>x<Esc> :noh<CR>bi  

" Split management>
" nnoremap <silent> [b :bprevious<cr>
" nnoremap <silent> ]b :bnext<cr>
" nmap 2ll :exe "vertical resize " . (winwidth(0) + 112)<CR>
nmap 2l :exe "vertical resize " . (winwidth(0) + 56)<CR>
" nmap 2hh :exe "vertical resize " . (winwidth(0) - 112)<CR>
nmap 2h :exe "vertical resize " . (winwidth(0) - 56)<CR>
nmap <Tab>l <C-w>l
nmap <Tab>h <C-w>h

nmap <S-h> :vertical res 1<Cr>
nmap <S-l> :vertical res 999<Cr>zz

nmap <A-=> :call AdjustFontSize(2)<CR>
nmap <A--> :call AdjustFontSize(-2)<CR>
nnoremap <leader>f :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>

map <Leader>n :NERDTreeToggle<CR>

autocmd BufWinEnter *.txt colorscheme wwdc17
autocmd BufWinEnter *.txt highlight mainPart guifg=darkcyan
autocmd BufWinEnter *.txt highlight doubleWord guifg=blue
autocmd BufWinEnter *.txt call matchadd ("mainPart", '\*.*\*')
autocmd BufWinEnter *.txt call matchadd ("doubleWord", '|.*|')
autocmd BufWinEnter *.txt syntax match Entity "*" conceal cchar= 
autocmd BufWinEnter *.txt syntax match Entity "|" conceal cchar= 
autocmd BufWinEnter *.txt set cole=3

winpos -0 -0
winsize 30 900
" highlight mainPart guifg=darkcyan
" match mainPart /\*.*\*/
" syntax match Entity "*" conceal cchar= 
" set cole=3

"--- plugin/s
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
":PlugInstall
 
" Initialize plugin system
call plug#end()

"linux search
"grep -rnw '/path/to/somewhere/' -e 'pattern'
"
"https://www.emojicopy.com/
"after the plugin have installed to apply comand  :source ~/.vimrc "and :PlugInstall
"snipMate — позволяет быстро вставить в документ текстовый шаблон с помощью ключевого слова
"vim-airline - добавляет красоты
"neocomplcache - автокомплит и мног очего ещё
" 'compatible' is not set
":put =expand('%:r') put file name in current line 
" :lcd %:p:h
"=====
" preparing for english training past perfect
" colorsceme gruvbox
" hi Visual guibg=lightblue guifg=black gui=bold
"=====
" for phases
" colorsceme wwcd17 
" hi Special  guifg=darkred  gui=bold
" path of colorscheme
"/usr/share/vim/vim81/colors
" hi MatchParen guibg=darkgreen ctermbg=none
" hi Normal ctermbg=NONE  "make background transparent in terminal 
