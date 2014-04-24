"调用pathogen加载全部插件
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"设置中文帮助
set helplang=cn
"设置命令前缀
let mapleader=";"
"tab键替换为4个空格
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
" 显示行数
set nu
"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch 
"文件编码
set encoding=utf8
set fileencodings=utf8,gbk
" 代码折叠
set foldmethod=indent
set foldlevel=99
" 窗口切分后，移动窗口的快捷键
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" OPEN TODO or FIXME
map <leader>td <Plug>TaskList
" 查看历史版本
map <leader>g :GundoToggle<CR>
" 语法高亮
syntax on                           " syntax highlighing
colorscheme darkblue
"colorscheme desert
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
"代码格式检查
let g:pep8_map='<leader>8'
"Tab补全
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
"转到定义
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
"打开文件浏览器
map <leader>n :NERDTreeToggle<CR>
"搜索
nmap <leader>a <Esc>:Ack!
"按下F5即可运行当前.py文件，辅以unittest即可。
au BufRead *.py map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>
"单元测试
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>
"taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"设置taglistbuffer的最高限制
let g:bufExplorerMaxHeight=30
let g:bufExplorerMaxWidth=30
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
"窗口管理器
"let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
"设置winmanager的宽度，默认为25
let g:winManagerWidth = 30
"定义打开关闭winmanager按键
nmap <silent> <F7> :WMToggle<cr>
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0
let g:miniBufExplorerMoreThanOne=0

let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList|Gundo"
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
nmap wm :WMToggle<CR>



" 在状态行上显示光标所在位置的行号和列号 
set ruler 
"set rulerformat=%30(%2*%<%f%=\ %m%r\ row:%3l\ col:%c\ %p%%%)

" 命令行（在状态行下）的高度，默认为1，这里是2 
"set cmdheight=2

" 不让vim发出讨厌的滴滴声 
set noerrorbells

" 在被分割的窗口间显示空白，便于阅读 
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

"把Cscope的查找结果输出到quickfix窗口
set cscopequickfix=s-,c-,d-,i-,t-,e-
