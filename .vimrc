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
set encoding=UTF-8
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
set spell
set spelllang=en_us
set smartindent
set splitright
set shiftwidth=4
"set copyindent
set autoindent 
set wrap
set linebreak
set nocp
" Smoother changes
set ttyfast
set cursorcolumn
set dictionary+=/usr/share/dict/func
set noswapfile
set nobackup
set directory=/tmp
set completeopt=noinsert,menuone
" set lines=80
" set columns=150
set filetype=php
"make vim understend aliased from bush
set laststatus=2
" set autochdir  "set current dir of oppened file

let g:phpactorPhpBin = 'php'
let g:phpactorBranch = 'master'
let g:phpactorOmniAutoClassImport = v:true
let g:phpactorOmniError = v:true

let g:foo_DefineAutoCommands = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:wwdc16_use16 = 1
"
let g:netrw_fastbrowse    = 1
" let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 3
" let g:netrw_retmap        = 1
let g:netrw_special_syntax= 1
let g:netrw_browse_split = 20
" let g:netrw_sort_direction=reverse
let g:netrw_winsize = 75
let g:closetag_html_style=1
" let g:netrw_localrmdir='rm -r'

color wwdc16
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
	autocmd VimEnter * :NERDTreeToggle
	execute 'normal \<S-b>'
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


function! Grab_block(lines, shift)
	let lin  = a:lines
	let shif = a:shift
	execute "normal ".shif."k".lin."yy".shif."jp"
endfunction

fun! Make_class()
	let space_name = ''
	let file_name = expand('%:t')[:-5]
	" let file_name = file[:-4]			" remove last two bytes
	let path_file = expand('%:p:h:t')
	if path_file == 'Controllers'
		let space_name = 'C'
	elseif path_file == 'Models'
		let space_name = 'M'
	elseif path_file == 'Helpers'
		let space_name = 'H'
	else
		let space_name = 'Comp'
	endif
	execute("normal i\nnamespace App".space_name."; \n\n")
	execute("normal iclass ".file_name."\n{\n,mfc\<Esc>ji\<cr>\<esc>\<s-o>")
	execute("normal a,mf")
	" execute "normal a\n"
endfunction


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
let php_html_in_strings=1
let php_html_load = 1

"no background  in  the terminal vim
hi Normal ctermbg=NONE  
hi Comment guifg=gray30 
hi Search guibg=red guifg=black
hi SpecialKey ctermfg=darkblue



"---mapping

vmap <C-c> "+y
vmap <C-v> "+gp
imap <C-v> <Esc>"+gp
" unmap <C-v> 
"+gp doesn't work because C-v does make block visual mode
nmap ev :tabedit $MYVIMRC <CR>
nmap ed :w <CR> :source $MYVIMRC<CR> :q<CR>


" nmap <Leader>n :Vex <CR> :vertical res 30 <CR>
" nmap <Leader>1 <C-w>l<S-z><S-z>:vertical res 120% <CR>

"close go next rigt and close left one.
nmap <Leader>1 <C-w>l:q<CR> 
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
vmap ,) <S-c>()<Esc>i<Cr><Esc>pkdd 
"making variables
imap ,mv $<Space>=<Space>//;<Esc>5hi
imap ,ma $arr_<Space>=<Space>[];<Esc><S-f>_a
imap ,mpp private<Space>$<Space>=<Space>'';<Esc>yy<S-f>$a
imap ,mp public<Space>$<Space>=<Space>'';<Esc>yy<S-f>$a
imap ,e <Esc><S-a>;<Esc>
"change current dir to opened file dir
nmap ,ccd :cd %:p:h<CR><CR>
"fined next appearance of //
imap ,f <Esc>/\/\/<CR>vlc
" go to end of line in insert mode
imap ,ge <Esc><S-a><Space>
"seve buffer
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
" save file
imap ,w (<Esc>lx$phxp
nmap ,ds <S-%>x<C-o>x   
"del pared parentheses"
" nmap <Leader>z xh/<C-R>-<CR>x<Esc> :noh<CR>bi  
nmap ,tp :set filetype=php<CR> 
nmap ,tj :set filetype=javascript<CR> 
nmap ,th :set filetype=html<CR> 
"above delete next similar character e.g. "
nmap vt vf>
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

"make arrey from block
vmap <leader>a :s/^/<Tab>'/ \| :'<,'>s/$/',/<CR><S-$>x gvdi$arr = [<CR><Esc>pkddki_

nmap <A-=> :call AdjustFontSize(2)<CR>
nmap <A--> :call AdjustFontSize(-2)<CR>
nmap <Leader>g :call Grab_block(1,)<Left>
nmap ,mc :call Make_class()<Left>
nnoremap <leader>f :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>


map <Leader>n :NERDTreeToggle<CR>

" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php setlocal omnifunc=phpactor#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
au BufNewFile *.html 0r ~/.vim/html.skel 
au BufNewFile *.php :exe('normal a<?php')
au BufRead *.html set filetype=html

autocmd FileType python,html,php setlocal foldmethod=indent
autocmd BufWinEnter *.py colorscheme wwdc17
autocmd FileType javascript inoremap cons console.log()<Esc>i
augroup tagsautocomplit
	autocmd!
	autocmd FileType html inoremap <di <div<Space>class=""></div><Esc><S-%>i<CR><CR><Esc>k<S-a><Tab>//<Esc>k7li
	autocmd FileType html inoremap <a <a<Space>href=""<Space>class="">//</a><Space><Esc><S-^>f"a
	autocmd FileType html inoremap <u <ul<Space>class=""><Esc>o<li></li><Esc>yyo</ul><Esc>k
	autocmd FileType html inoremap <sel <select<Space>class=""><Esc>o<option value=""></option><Esc>yyo</select><Esc>k
	autocmd FileType html inoremap <p <p<Space>class=""<Space>id="">//</p><Esc><S-^>f"a
augroup END

autocmd FileType php inoremap ,mcf public<Space>function<Space>__construct()<CR>{<CR>}<Esc>ko
autocmd FileType php inoremap ,mpf private<Space>function<Space>()<CR>{<CR>}<Esc>ko//<Esc>kkf<S-(>i
autocmd FileType php inoremap ,msf public<Space>static<Space>function<Space>()<CR>{<CR>}<Esc>ko//<Esc>kkf<S-(>i
autocmd FileType php inoremap ,mf public<Space>function<Space>__n()<CR>{<CR>}<Esc>ko//<Esc>
autocmd FileType php inoremap $th $this-><C-x><C-o>
autocmd FileType php inoremap self self::<C-x><C-o>
autocmd FileType php inoremap -> -><C-x><C-o>
autocmd FileType php inoremap <?= <?=?><Esc>hi
autocmd FileType php inoremap if( if(){<CR>}else{<CR>}<Esc><S-o>//<Esc>k<S-o>//<Esc>khha<Space><Space><Esc>i


"--- plagins
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'StanAngeloff/php.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jwalton512/vim-blade'
":PlugInstall
 
" https://github.com/SirVer/ultisnips
" Initialize plugin system
call plug#end()
"linux search
"grep -rnw '/path/to/somewhere/' -e 'pattern'
"
"
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
