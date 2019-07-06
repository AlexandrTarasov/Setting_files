set number
set relativenumber
set guioptions -=T
"set expandtab
set ghr=0
set noequalalways
set tabstop=4
set guifont=Monospace\ 16px
set linespace=1
filetype plugin on " plugins are enabled
set hlsearch
set incsearch
set encoding=utf-8
set splitright
" set splitbelow
syntax on
set listchars=eol:¬,trail:·,extends:>,precedes:<,space:-,tab:↓-
set list! "show unprintable simbols
" set nolist
set mps+=<:>
set showmatch
set confirm
set title "name of current buffer
set incsearch " поиск фрагмента по мере его набора
set smartindent
set splitright
set shiftwidth=4
"set copyindent
set autoindent 
set wrap
set linebreak
" Smoother changes
set ttyfast
set cursorcolumn
set dictionary+=/usr/share/dict/func
set noswapfile
set nobackup
set directory=/tmp
" set lines=80
" set columns=150
set filetype=php
set laststatus=2

let g:foo_DefineAutoCommands = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:wwdc16_use16 = 1
color wwdc16
"
" let g:netrw_altv          = 1
" let g:netrw_fastbrowse    = 1
" let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 3
" let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1
let g:netrw_browse_split = 20
" let g:netrw_sort_direction=reverse
let g:netrw_winsize = 85
let g:netrw_ftp_cmd="ftp -p"
let g:closetag_html_style=1
" let g:netrw_localrmdir='rm -r'
"
" let g:gruvbox_contrast_dark = 'light'
" set bg=light "set light for gruvbox

if exists('+colorcolumn')
 set colorcolumn=80
endif
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=60 co=160
endif

if getcwd() == "/media/alex/1C5036035035E3E4/0-Studying/English/words-phrases"
	" execute "set co=999"
	execute 'so Session.vim'
	execute "normal \<c-w>="
endif
if getcwd() == "/home/alex"
	let g:netrw_list_hide = '^\..*$'
	autocmd VimEnter * :Ex
endif
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
"if version >= 703

"set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ [:%{&ff}]\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]

"---functions

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
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


function! Grab_block(lines, shift)
	let lin  = a:lines
	let shif = a:shift
	execute "normal ".shif."k".lin."yy".shif."jp"
endfunction

" fun! PR_fun()
" 	if matchstr(getline("."), "pr-f") == 'pr-f'
" 
" 	endif
" 	if matchstr(getline("."), "pu-f") == 'pu-f'
" 		execute "normal d2"
" 	endif
" 	if matchstr(getline("."), "pu-cf") == 'pu-cf'
" 		execute "normal d3"
" 	endif
" endfun

" autocmd MyAutoCmd VimLeavePre *  call QuitNetrw()

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
" full settings here http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
" Puts in the current git status
" if count(g:pathogen_disabled, 'Fugitive') < 1
" 	set statusline+=%{fugitive#statusline()}
" endif
"
" " Puts in syntastic warnings
" if count(g:pathogen_disabled, 'Syntastic') < 1  
"         set statusline+=%#warningmsg#
"         set statusline+=%{SyntasticStatuslineFlag()}
"         set statusline+=%*
" endif


                        
let php_sql_query=1
let php_htmlInStrings=1

"no background  in  the terminal vim
hi Normal ctermbg=NONE  
hi Comment guifg=gray30 
hi Search guibg=red guifg=black
hi SpecialKey ctermfg=darkblue



"---mapping

vmap <F2> "+y
vmap <F3> "+gp
imap <F3> <C-c>"+gp
nmap <F3> "+gp
nmap ev :tabedit $MYVIMRC <CR>
nmap ed :w <CR> :source $MYVIMRC<CR> :q<CR>


" nmap <Leader>n :Vex <CR> :vertical res 30 <CR>
" nmap <Leader>1 <C-w>l<S-z><S-z>:vertical res 120% <CR>
nmap <Leader>1 <C-w>l:q<CR> "close go next rigt and close left one.
nmap <Leader>[ :set co-=35<CR>
nmap <Leader>] :set co+=35<CR>
imap <Leader>ec <Esc><S-a>echo"</br>";<Esc>
imap ,, <Esc>
vmap ,, <Esc>
"buffer only
" nnoremap <leader>bo :call te#tools#buf_only('', '')<cr>
vmap <F12> <C-c>j<S-$>v<S-^><F2><S-v>zz
vmap ,' d<Esc>i'<Esc>pe
vmap ," d<Esc>i"<C-c>pe
"put line of text in curly braces
vmap ,] <S-c>{}<Esc>i<Cr><Esc>pkdd 
"seve buffer
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
"wrap by parentheses 
imap <Leader>w (<Esc>lxea);  
"del pared parentheses"
nmap <Leader>s <S-%>x<C-o>x   
" nmap <Leader>z xh/<C-R>-<CR>x<Esc> :noh<CR>bi  
nmap ,sp :set filetype=php<CR> 
nmap ,sj :set filetype=javascript<CR> 
nmap ,sh :set filetype=html<CR> 
"above delete next similar character e.g. "
nmap vt vf>

imap <Leader>; <Esc><S-a>;<Esc>
imap <Leader>c <Esc>ya><S-$>p<S-%>a/<Esc>hi<CR><CR><Esc>ki<Tab> 
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr> 
"add the same close tab
" Split management>
" nnoremap <silent> [b :bprevious<cr>
" nnoremap <silent> ]b :bnext<cr>
" nmap 2ll :exe "vertical resize " . (winwidth(0) + 112)<CR>
nmap 2l :exe "vertical resize " . (winwidth(0) + 56)<CR>
" nmap 2hh :exe "vertical resize " . (winwidth(0) - 112)<CR>
nmap 2h :exe "vertical resize " . (winwidth(0) - 56)<CR>
nmap <Tab>l <C-w>l
nmap <Tab>h <C-w>h

nmap <A-=> :call AdjustFontSize(2)<CR>
nmap <A--> :call AdjustFontSize(-2)<CR>
nmap <Leader>g :call Grab_block(1,)<Left>
nnoremap <leader>f :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
"machine autoritetparts.com.ua login ftpuser password pas
"nunmap .
" nunmap ;;



map <Leader>n :NERDTreeToggle<CR>

autocmd FileType php set foldmethod=syntax
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
au BufRead *.html set filetype=htmlm4
autocmd FileType python,html setlocal foldmethod=indent
autocmd BufWinEnter *.py colorscheme wwdc17
augroup tagsautocomplit
	autocmd!
	autocmd FileType html inoremap <di <div<Space>class=""></div><Esc><S-%>i<CR><CR><Esc>k<S-a><Tab>
	autocmd FileType html inoremap <a <a<Space>href=""></a><Space><Esc>F<i
	autocmd FileType html inoremap <u <ul<Space>class=""><Esc>o<li></li><Esc>yyo</ul><Esc>k
	autocmd FileType html inoremap <sel <select<Space>class=""><Esc>o<option value=""></option><Esc>yyo</select><Esc>k
augroup END


autocmd FileType php inoremap cons console.log()<Esc>i

autocmd FileType php inoremap __сo function<Space>__construct(){<CR>}<Esc>kwwi
autocmd FileType php inoremap fpu public<Space>function<Space>(){<CR>}<Esc>kwwi
autocmd FileType php inoremap fpr private<Space>function<Space>(){<CR>}<Esc>kwwi
autocmd FileType php inoremap fps public<Space>static<Space>function<Space>(){<CR>}<Esc>kwwwi


"--- plagins
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'StanAngeloff/php.vim'
Plug 'jwalton512/vim-blade'
":PlugInstall

" https://github.com/SirVer/ultisnips
" Initialize plugin system
call plug#end()

"TODO  :%s/^/'/g      :%s/$/'/g    make array from lines

"after the plugin have installed to apply comand  :source ~/.vimrc "and :PlugInstall
"snipMate — позволяет быстро вставить в документ текстовый шаблон с помощью ключевого слова
"vim-airline - добавляет красоты
"neocomplcache - автокомплит и мног очего ещё
" 'compatible' is not set
set nocp                   

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

