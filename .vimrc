" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" :BundleInstall

"基本配置
set nocompatible
"vim 插件管理
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'DoxygenToolkit.vim'
Bundle 'scrooloose/syntastic'
" 主题 molokai
Bundle 'tomasr/molokai'
" monokai原始背景色
let g:molokai_original = 1

"语法检测设置
filetype    on                      " 检测打开文件的类型
syntax      on                      " 开启语法高亮
syntax      enable                  " 激活语法高亮
filetype    plugin on               " 允许特定的文件类型载入插件文件
filetype    indent on               " 允许特定的文件类型载入缩进文件
" 文件类型的自动检测和设定
autocmd     BufRead,BufNewFile      *.go                    set filetype=go
autocmd     BufRead,BufNewFile      *.{md,mkd,mkdn,mark*}   set filetype=markdown
autocmd     BufRead,BufNewFile      *.tex                   set filetype=tex
" 主题
colorscheme molokai
"编码及存储
set fileencodings=utf-8             " 文件编码，强制UTF-8
set encoding=utf-8                  " vim内部编码
set nobomb                          " 不使用bom编码
set nobackup                        " 不使用备份文件
set noswapfile                      " 不产生交换文件
set autoread                        " 自动同步外部修改
" 缩进
set autoindent                      " 开启新行时，自动缩进
set smartindent                     " 开启新行时，智能缩进
set cindent                         " C程序自动缩进

" 空白
set shiftwidth=4                    " 缩进空白数
set tabstop=4                       " Tab所占空格数
set expandtab                       " 将Tab展开为空格
set softtabstop=4                   " 配合tabstop
set listchars=tab:▸\ ,trail:▫       " 指定Tab和结尾空白字符
set number                          " 显示行号

" 状态栏/标尺
set ruler                           " 显示光标所在位置
set cursorline                      " 高亮当前行
set showcmd                         " 再屏幕最后一行显示命令
set laststatus=2                    " 始终显示状态栏
set cmdheight=1                     " 命令行使用的屏幕行数

"搜索和匹配
set showmatch                       " 高亮显示匹配的括号
set matchtime=5                     " 匹配括号高亮的时间(单位是十分之一秒)
set ignorecase                      " 搜索时忽略大小写
set smartcase                       " 如果搜索模式包含大写字符，不使用'ignorecase'选项
set hlsearch                        " 高亮被搜索的内容
set incsearch                       " 增量搜索
set t_Co=256                        " 开启256色支持

" others
"set mouse=a                         " 所有模式下，开启鼠标支持
set wildmenu                        " 命令行补全以增强模式运行
set splitright                      " 竖直新分割的窗口在右侧
set splitbelow                      " 水平新分割的窗口在下面

" 打开上次编辑位置
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif

"python的基础设定
"let g:python_highlight_all                  = 1
"let g:python_highlight_builtin_funcs        = 1
"let g:python_highlight_exceptions           = 1
"let g:python_highlight_builtin_objs         = 1
"let g:python_highlight_string_formatting    = 1

" DoxygenToolkit快捷键
map da      :DoxAuthor<cr>
map df      :Dox<cr>
map db      :DoxBlock<cr>

" DoxygenToolkit.vim  文档插件
" :DoxLic        插入License信息
" :DoxAuthor     插入作者信息
" :Dox           插入文档注释
let g:DoxygenToolkit_authorName             = "feythin lau"
let g:DoxygenToolkit_licenseTag             = "BSD\<enter>"
let g:DoxygenToolkit_undocTag               = "DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre           = "@brief\t\t"
let g:DoxygenToolkit_paramTag_pre           = "@param\t\t"
let g:DoxygenToolkit_returnTag              = "@return\t\t"
let g:DoxygenToolkit_throwTag_pre           = "@exception\t\t"
let g:DoxygenToolkit_briefTag_funcName      = "yes"
let g:DoxygenToolkit_maxFunctionProtoLines  = 30 


" syntastic  支持多种语言的语法检查插件
"let g:syntastic_check_on_open               = 1
"let g:pep8_cmd                              = g:config_flake8_dir . 'pep8'
"let g:flake8_cmd                            = g:config_flake8_dir . 'flake8'
"let g:pyflakes_cmd                          = g:config_flake8_dir . 'pyflakes'
"let g:pylint_cmd                            = g:config_flake8_dir . 'pylint'
"let g:syntastic_python_checkers             = ['pylint', 'flake8', 'pep8', 'pyflakes']
"let g:syntastic_python_pylint_args          ="-disable-msg=C0103 --max-line-length=120"
"let g:syntastic_python_pep8_args            ="--max-line-length=120"
"let g:syntastic_python_flake8_args          ="--max-line-length=120 --max-complexity=6"                                                                                             
"let g:syntastic_always_populate_loc_list    =1


autocmd FileType python         map <buffer> <F7>    :Errors<CR>
