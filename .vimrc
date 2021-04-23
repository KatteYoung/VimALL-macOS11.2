"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"general configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Monaco_for_Powerline:h16
set encoding=UTF-8      "编码
set nocompatible        "不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题和旧的BUG
set autochdir           "当打开文件时，自动切换当前工作目录
set history=100         "记录历史行数
set noerrorbells        "无提示音
set novisualbell        "无提示音
set vb t_vb=            "当VIM编辑时，输入的命令行错误时候，无提示音
set autoread            "外面文件改变，自动读取
set modifiable          "可修改
set backspace=indent,eol,start
autocmd! bufwritepost .vimrc source ~/.vimrc "vimrc配置文件改变，重新加载

""搜索
set ignorecase          "搜索忽略大小写
set smartcase           "搜索的字符串全小写时，忽略大小写搜索；当有一个是大写字母时，不忽略大小写搜索
set magic               "使用正则表达式时，除了 $ . * ^ 之外其他元字符都要加反斜杠
set nowrapscan          "不循环搜索
set incsearch           "实时搜索，即搜索时候找到第一个匹配项

""括号匹配
set showmatch           "显示括号匹配情况
set matchtime=2         "括号匹配时间（十分之一秒）
set hlsearch            "高亮匹配项

""显示
set cursorline          "光标线
set number              "显示行号
set ruler               "编辑的时候在右下角显示光标位置状态行
set wildmenu            "单词补充会展示下拉宽菜单
syntax on               "自动语法高亮
set display=lastline    "自动换行当折行高度超过窗口此行会看不到
"set iskeyword+=_,$,@,%,# " 带有如下符号的单词不要被换行分割

""高亮设置
set t_Co=256            "256色
colorscheme molokai
" colorscheme solarized
"设置缩进格式
autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2 
autocmd BufNewFile,BufRead * :syntax match cfunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi CursorLine cterm=underline,bold 
set background=dark

" 打开文件光标恢复到上次文件关闭时候的位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


""文件类型
filetype on             "检测文件类型
filetype plugin on      "检测文件类型插件
filetype indent on      "不同文件类型，不同缩进

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""不要生成swap文件，当buffer被丢弃的时候隐藏它
set nobackup
set nowb
set noswapfile
set bufhidden=hide


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"judge operation system is windows or linux
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if(has("win32") || has("win95") || has("win64") || has("win16")) "判定当前操作系统类型
    let g:iswindows=1
else
    let g:iswindows=0
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""统一缩进为4空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

autocmd FileType Makefile set noexpandtab   "指定文件类型,这样.mak和Makefile文件将都会使用真实tab

set lbr     "line break 折行的时候，选择空白而非单词，避免拆分单词, 非真正折行
set tw=500  "折行宽度，text wide，每行超过该数目字符会自动折行，真正折行
set wrap    "折行

set ai      "自动缩进 
set si      "智能缩进 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"key map  ---nmap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w!<cr> 
nmap <leader>qq :qa!<cr>
nmap <leader>wq :wq<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Visual mode ---vmap 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-plug 插件管理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved  
filetype off                  " required!  
  
call plug#begin('~/.vim/plugged')

" My bundles here: 
" original repos on GitHub 
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'  
Plug 'git://git.wincent.com/command-t.git'  
" Git repos on your local machine (i.e. when working on your own plugin)  
"Plug 'file:///Users/gmarik/path/to/plugin'  

"myself
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'powerline/fonts'

"Plug 'iamcco/markdown-preview.vim'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

"对齐
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'Chiel92/vim-autoformat'

"语意补全
" Plug 'Valloric/YouCompleteMe'

"老插件
Plug 'vim-scripts/a.vim'
" Plug 'vim-scripts/ShowMarks'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/TaskList.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'fholgado/minibufexpl.vim'
Plug 'dimasg/vim-mark'

"gtags/tags相关
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'

"代码检查
Plug 'w0rp/ale'

"括号自动补全
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'

"语法高亮增强
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()
" ...  
filetype plugin indent on     " required!  


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rdnetto/YCM-Generator 使用
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 在~/.vim/bundle/YCM-Generator路径下有一个用于生成ycm配置文件的Python脚本：
" config_gen.py
" 通常的用法是后面加一个工程路径的参数：
" ./config_gen.py your/project/path
" 这个工程需要可编译，当然，我们在linux环境下做开发，makefile自然是少不了，它也支持cmake的构建，只要是构建好的工程，它都可以在工程路径下生成一个.ycmextra_conf.py的配置文件。
" 我们还可以写一个后天脚本，让它自动更新，以便跟上代码的变化，比如可以写如下内容的一个脚本：
" #!/bin/bash
" while :
" do
"     sleep 5
"     /home/zhanghaoran/.vim/bundle/YCM-Generator/config_gen.py -f ~/class/gtest/mysrc/
" done
" 运行这个脚本，就可以让配置文件每隔5秒更新一次。其实观察下source insight，其实它也是每隔几秒就进行一次代码同步的。

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"gtags auto generate ctags/gtags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
" 避免多个项目数据库相互干扰
" 使用plus插件解决问题
let g:gutentags_auto_add_gtags_cscope = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"gscope nmap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_plus_nomap = 1
noremap <C-\>s :GscopeFind s <C-R><C-W><cr>
noremap <C-\>g :GscopeFind g <C-R><C-W><cr>
noremap <C-\>c :GscopeFind c <C-R><C-W><cr>
noremap <C-\>t :GscopeFind t <C-R><C-W><cr>
noremap <C-\>e :GscopeFind e <C-R><C-W><cr>
noremap <C-\>f :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <C-\>i :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <C-\>d :GscopeFind d <C-R><C-W><cr>
noremap <C-\>a :GscopeFind a <C-R><C-W><cr>
noremap <C-\>k :GscopeKill<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-preview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"预览 quickfix 窗口 ctrl-w z 关闭
"P 预览 大p关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
noremap <Leader>u :PreviewScroll -1<cr> " 往上滚动预览窗口
noremap <leader>d :PreviewScroll +1<cr> "  往下滚动预览窗口


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrl + j/k 进行上下选择
" ctrl + x 在当前窗口水平分屏打开文件
" ctrl + v 同上, 垂直分屏
" ctrl + t 在tab中打开
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrlp-Funky
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader>fu 进入当前文件的函数列表搜索
" <leader>fU 搜索当前光标下单词对应的函数
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:ctrlp_extensions = ['funky']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :a,b Tab/=>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tasklist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>td <Plug>TaskList   "Todo 定位FIXME、TODO等

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"DoxygenToolkit 函数注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>df : Dox<cr>
nmap <leader>da : DoxAuthor<cr>
"vmap dl ：DoxLic
let g:DoxygenToolkit_authorName="Xinyao Yang"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"MINIBUF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:bufExplorerSortBy = "name"
"<- and -> is used to switch buffers
let g:miniBufExplorerAutoStart = 1
let g:miniBufExplBuffersNeeded = 1
let g:miniBufExplHideWhenDiff = 1
let g:miniBufExplSetUT = 1
let g:miniBufExplCycleArround = 1

noremap <C-h> :MBEbp<cr>                        "切换前一个buffer
noremap <C-l> :MBEbn<cr>                        "切换后一个buffer
noremap <leader>bd :MBEbw<cr>                   "关闭buffer sheet


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"grep
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>g :Grep<CR>        "在VIM编辑时候搜索

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"input time of now
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>   "扩展xdata为当前时间

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickfix
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
map <leader>cq :ccl<cr>
map <leader>c :cw<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fold
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldenable
"set nofen
"set foldmethod=indent
"set foldmethod=syntax
"set foldmethod=manual
"set foldcolumn=1
"setlocal foldlevel=3
"set foldmethod=manual, indent, expr, diff ,marker
"nnoremap <space> @=((foldclosed(line('.'))<0)? 'zc':'zo')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
".c与其头文件.h 切换"
nnoremap <silent> <F1> :A<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F3> :NERDTreeToggle<CR>

let NERDTreeWinSize=30
let NERDTreeWinPos = "right"
let NERDTreeMouseMode=1
let NERDTreeWin_Exit_OnlyWindow=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./.tags;,.tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F2> :TlistToggle<CR>

let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 0         " 在右侧窗口中显示taglist窗口if = 1
let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1
let Tlist_Inc_Winwidth=0
"let Tlist_Sort_Type="name"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_show_diagnostics_ui = 0 "语法检查关闭
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
let g:ycm_complete_in_comments = 1 "在注释输入中也能补全
let g:ycm_complete_in_strings = 1 "在字符串输入中也能补全
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:clang_user_options='|| exit 0'
"跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 

let g:ycm_python_binary_path = '/usr/bin/python2.7'
" nmap<C-a> :YcmCompleter FixIt<CR>
" nmap<S-F12> :YcmToggleLogs stderr<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1、 \cc 注释当前行和选中行
" 2、 \cn 没有发现和\cc有区别
" 3、 \c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作
" 4、 \cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
" 5、 \ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
" 6、 \cs 添加性感的注释，代码开头介绍部分通常使用该注释
" 7、 \cy 添加注释，并复制被添加注释的部分
" 8、 \c$ 注释当前光标到改行结尾的内容
" 9、 \cA 跳转到该行结尾添加注释，并进入编辑模式
" 10、\ca 转换注释的方式，比如： /**/和//
" 11、\cl \cb 左对齐和左右对其，左右对其主要针对/**/
" 12、\cu 取消注释

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 对应语言需要安装相应的检查工具
" https://github.com/w0rp/ale
"    let g:ale_linters_explicit = 1 "除g:ale_linters指定，其他不可用
"    let g:ale_linters = {
"\   'cpp': ['cppcheck','clang','gcc'],
"\   'c': ['cppcheck','clang', 'gcc'],
"\   'python': ['pylint'],
"\   'bash': ['shellcheck'],
"\   'go': ['golint'],
"\}
"
let g:ale_sign_column_always = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1"打开quitfix对话框

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
map <F7> ::ALEToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"air-line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enhanced-highlight
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:cpp_no_function_highlight = 0         "highlight switch
let g:cpp_concepts_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"rainbow parentheses
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"auto-format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F4> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
autocmd FileType vim,tex let b:autoformat_autoindent=0

""""""""""""""""""""""""""""""""""""""""C语言的编译运行"""""""""""""""""""""""""""""""""""""""""
" <F5>编译C/py语言，<F6>运行
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup ccompile
    autocmd Filetype c map <F5> <Esc>:w<CR>:!gcc % -std=c99 -g -o %< -lm <CR>
    autocmd Filetype cpp map <F5> <Esc>:w<CR>:!g++ % -std=c++11 -g -o %< -lm <CR>
    autocmd Filetype python map <F5> <Esc>:w<CR>:!python2 % <CR>
    autocmd Filetype python map <F5> <Esc>:w<CR>:!python3 % <CR>
augroup END

augroup crun
    autocmd Filetype c map <F6> <Esc>:! ./%< <CR>
    autocmd Filetype cpp map <F6> <Esc>:! ./%< <CR>
augroup END

