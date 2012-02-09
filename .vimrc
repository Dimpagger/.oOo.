"source $VIMRUNTIME/vimrc_example.vim

"""""""""""""""""""""""""""""""""""""""
"ƽ̨�ж�
"""""""""""""""""""""""""""""""""""""""
function! MySys()
	if has("win32")
		return "windows"
	else
		return "linux"
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""
"ģ��MS��ݼ�
"""""""""""""""""""""""""""""""""""""""
"source $VIMRUNTIME/mswin.vim

" CTRL-X and SHIFT-Del are Cut
"vnoremap <C-X> "+x

" CTRL-C and CTRL-Insert are Copy
"vnoremap <C-C> "+y

" CTRL-V and SHIFT-Insert are Paste
"map <C-V>		"+p

"""""""""""""""""""""""""""""""""""""""
"Gerneral
"""""""""""""""""""""""""""""""""""""""
" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" �༭vimrc֮�����¼���
if MySys() == "windows"
	autocmd! bufwritepost _vimrc source ~/_vimrc
else
	autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" ����Vi�ļ���ģʽ
set nocompatible

" Set windows postion and size
if has("gui_running")
	"winpos 620 0
	"set lines=47
	"set columns=85
endif

" �趨״̬������ʾ��Ϣ
set laststatus=2

if exists('+autochdir')
	" �ļ�·������Ϊ��ǰ·��
	set autochdir
endif

"auto save zz info
au BufWinLeave *.* silent mkview
au BufWinEnter *.* silent loadview

"""""""""""""""""""""""""""""""""""""""
"VIM user interface
"""""""""""""""""""""""""""""""""""""""
" use chinese help
"set helplang=cn

"set the menu & the message to English
set langmenu=en_US
let $LANG="en_US.UTF-8"

set ruler "���½���ʾ��ǰ���

"set cmdheight=2 "The commandbar height

" Set backspace config
set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase
"set nowrapscan

" ʹ����ͳ����������
"nnoremap / /\v
"vnoremap / /\v

set hlsearch "Highlight search things

set incsearch "�����벿�ֲ���ģʽʱ��ʾ��Ӧ��ƥ��㡣
"set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them

set sidescroll=10 "�����ƶ��߾�

"set list " ��ʾ�Ʊ��/�س���
set listchars=tab:>-,trail:$ " ��β����

set showcmd "��ʾ���½�����
set cursorline

set noerrorbells
set novisualbell

"set iskeyword=@,48-57,192-255

if ! has("gui_running")
	set mouse-=a
endif

"�趨�������
if exists('+colorcolumn')
	au FileType python set colorcolumn=79
	au FileType asciidoc set colorcolumn=79
endif

set equalalways "�ָ��ʱ������ȵĿ�/��

set guitablabel=%N.%t " �趨��ǩ����ʾ���

"""""""""""""""""""""""""""""""""""""""
"Colors and Fonts
"""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl
"au BufRead,BufNewFile *.aspx set filetype=xml

" Set syntax color
colorscheme desert256

"gfn=consolas:h10
"set gui options
if has("gui_running")
	set guifont=Monospace\ 10
	"set gfw=��Բ:h10:cGB2312
	set guioptions -=m
	set guioptions -=T
	set guioptions -=L
	set guioptions -=r
	"set showtabline=0
endif

set ambiwidth=double " �趨ĳЩ������Ϊ���ַ�

" �趨����tabΪ��ɫ
highlight LeaderTab guifg=#666666

"""""""""""""""""""""""""""""""""""""""
"Files, backups and undo
"""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
set backupext=.bak

"���ñ���
set fileencodings=utf-8,gbk,ucs-bom,default,latin1
set termencoding=utf-8
set encoding=utf-8

"Persistent undo
if exists('+undodir')
	if MySys() == "windows"
		set undodir=C:\Windows\Temp
	else
		set undodir=~/.vim_runtime/undodir
	endif
	set undofile
endif

"""""""""""""""""""""""""""""""""""""""
"Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""

"set expandtab
set noexpandtab "�Ƿ�ʹ��Tab���� Ĭ��ʹ��

set shiftwidth=4
set tabstop=4
set smarttab

set lbr "���ܻ���
"set tw=500 "�Զ����� ����n��

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

"�����ļ����͵���������
au FileType python setlocal expandtab
"au FileType html setlocal shiftwidth=2
"au FileType html setlocal tabstop=2

" textwidth
au FileType python setlocal textwidth=79 fo+=Mm

set showmatch " show matching bracets

"""""""""""""""""""""""""""""""""""""""
"Visual mode related
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"Command mode related
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

"""""""""""""""""""""""""""""""""""""""
"Visual Cues
"""""""""""""""""""""""""""""""""""""""
if exists(':relativenumber')
	set number " ��ʾ�к�
else
	set relativenumber " ��ʾ����к�
endif
set numberwidth=2 "�к����Ŀ��
" set foldclose=all

"function! MarkPoint()
	"mark `
"endfunction

"autocmd CursorMoved * call MarkPoint()


"""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
" Plugin
"""""""""""""""""""""""""""""""""""""""
set tags=tags;

"pydiction 1.2 python auto complete
"let g:pydiction_location = 'D:/Program Files/Vim/vimfiles/ftplugin/pydiction'
"defalut g:pydiction_menu_height == 15
"let g:pydiction_menu_height = 20

"SuperTab
"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>" 

"Neo
"let g:neocomplcache_enable_at_startup=1

"""""""""""""""""""""""""""""""""""""""
" Map
"""""""""""""""""""""""""""""""""""""""
map <F2>    :Tlist<cr>
"�����۵���ݷ�ʽ
map <F3>    zO
map <F4>    zC
map <F5>    zR
map <F6>    zM

" ��ǩ����
map <F11>    gT
map <F12>    gt
if has("gui_running")
	imap <M-1> <Esc>1gt
	nmap <M-1> 1gt
	imap <M-2> <Esc>2gt
	nmap <M-2> 2gt
	imap <M-3> <Esc>3gt
	nmap <M-3> 3gt
	imap <M-4> <Esc>4gt
	nmap <M-4> 4gt
	imap <M-5> <Esc>5gt
	nmap <M-5> 5gt
	imap <M-6> <Esc>6gt
	nmap <M-6> 6gt
	imap <M-7> <Esc>7gt
	nmap <M-7> 7gt
	imap <M-8> <Esc>8gt
	nmap <M-8> 8gt
	imap <M-9> <Esc>9gt
	nmap <M-9> 9gt
endif

"Map F9 to Run Python Script
au FileType python map <F9> :!python %
" �ÿո���������۵�
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" ��Tabƥ������
nnoremap <tab> %
vnoremap <tab> %

" �� * / # ƥ��ѡ��
vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" html����
let g:html_indent_inctags = "p,li,dt,dd"

"""""""""""""""""""""""""""""""""""""""
" �Զ�������
"""""""""""""""""""""""""""""""""""""""
" ɾ����β�ո���
command! -nargs=0 TrimR :%s/\s\+$//g

function! Pdb()
	normal o
	normal <ESC>
	call setline(line("."), "import pdb")
	call setline(line(".") + 1, "pdb.set_trace()")
endfunction
