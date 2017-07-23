"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Space>0 /def\s\\|class\s<CR>
nnoremap <silent> <Space>9 /def <CR>

""""""""copy current file path""""""""""""""""""
nmap <S-C> :let @+=expand("%:p")<cr>:echo "Copy the current filename is completed!"<cr>
nmap <m-S-C> :let @+=expand("%:p:h")<cr>:echo "Copy the current path is completed!"<cr>
inoremap kj <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>
noremap <leader>e <esc>:e
nnoremap  <Space>e :NERDTree

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
"cno $c e <C-\>eCurrentFileDir("e")<cr>

" ; split window open in new tab
nnoremap <Space>1 <C-W>T
inoremap <c-e> <end>
inoremap <c-a> <esc>^i
inoremap <c-x><c-b> <esc>Bi
inoremap <c-x><c-f> <esc>Ea
inoremap <c-x><c-k> <up>
inoremap <c-x><c-j> <down>
inoremap <C-b> <left>
inoremap <C-f> <right>
noremap $j <esc>o<esc>
noremap $k <esc>O<esc>
noremap <s-cr> <esc>O<esc>
inoremap <s-cr> <esc>O<esc>i
noremap <c-cr> <esc>o<esc>
inoremap <c-cr> <esc>o<esc>i
nnoremap <leader>ww :set fenc=<cr>

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929 match OverLength /\%81v.\+/
""""""""skilll"""""""
" g;  g, 修改过的地方来回切换
" `.  '. 最后修改的地方
" ``      两次修改的地方切换
" gg=G对齐

" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <Space>3 <C-W>h
map <Space>4 <C-W>l


" tab 操作
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim
" tab切换
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>
map t] :tabnext<cr>
map t[ :tabprev<cr>
" map <right> :tabnext<cr>
" map <left> :tabprev<cr>
" map <leader>te :tabedit<cr>
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

" normal模式下切换到确切的tab
" map <M-1> 1gt
" map <M-2> 2gt
" map <M-3> 3gt
" map <M-4> 4gt
" map <M-5> 5gt
" map <M-6> 6gt
" map <M-7> 7gt
" map <M-8> 8gt
" map <M-9> 9gt
" 新建tab  Ctrl+t space n
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-S-Down> ddp
nnoremap <C-S-Up> ddkP

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" Go to home and end using capitalized directions
noremap H ^
noremap L $
nnoremap ; :

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" 搜索相关
map <space>s /
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v
" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
" 去掉搜索高亮
noremap <silent><leader><CR> :nohls<CR>
" switch # *
nnoremap # *
nnoremap * #

" tab/buffer相关
" 切换前后buffer
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>
nnoremap b[ :bprevious<cr>
nnoremap b] :bnext<cr>


" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv
" y$ -> Y Make Y behave like other capitals
map Y "+y$
" 复制选中区到系统剪切板中
vnoremap <c-c> "+y
vnoremap <c-v> "+p
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" select block
nnoremap <leader>v V`}
" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" Quickly close the current window
nnoremap <leader>q :q<CR>
" Quickly save the current file
nnoremap <leader>w :w!<CR>
" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '
" remap U to <C-r> for easier redo
nnoremap U <C-r>
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <C-F9> :so $MYVIMRC<CR>
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader><F1> :cd %:p:h<cr>:pwd<cr>


"""""""""""""""""""""""""""""""""""""
" 代码折叠自定义快捷键 <leader>zz
"""""""""""""""""""""""""""""""""""""
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

"""""""""""""""""""""""""""""""""""""
"显示相对行号ctrl-n
"""""""""""""""""""""""""""""""""""""
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber number
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

"""""""""""""""""""""""""""""""""""""
"F1-F5 key
"""""""""""""""""""""""""""""""""""""
" F2 行号开关，用于鼠标复制代码用
function! HideNumber()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc
nnoremap <C-F2> :call HideNumber()<CR>

" F3 显示可打印字符开关
nnoremap <C-F3> :set list! list?<CR>
"
" F4 换行开关
nnoremap <C-F4> :set wrap! wrap?<CR>

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <C-F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

set pastetoggle=<C-F5>            "    when in insert mode, press <F5> to go to
"    paste mode, where you can paste mass data
"    that won't be autoindented
" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste
" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"""""""""""""""""""""""""""""""""""""
"多窗口是，最小化非活动窗口
"""""""""""""""""""""""""""""""""""""
" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


set guioptions-=e
set vb t_vb=
function! FindDef(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'def'
        call CmdLine("/def\\s\\\\\|class\\s")
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

nnoremap <CR> G
nnoremap <BS> gg
" autocmd VimEnter * NERDTree

""""""""""""""OS CONF""""""""""""""""
""配置快捷键，进入常用目录
"""""""""""""""""""""""""""""""""""""
if has("win16") || has("win32")
    map <Leader>ed :e D:\<cr>
    map <Leader>ee :e E:\<cr>
    map <Leader>ef :e F:\<cr>
    map <Leader>eg :e G:\<cr>
    map <Leader>eo :NERDTree G:\03_gitHub_pro\github_wangfmD\notes<cr>
    map <Leader>ea :NERDTree D:\00_opt\autoTest_pro\<cr>
else
    map <Leader>eo :NERDTree /opt/github/<cr>
    map <Leader>ea :NERDTree /opt/autoTest_pro/<cr>
endif
"""""""""""""""""""""""""""""""""""""
"end
"""""""""""""""""""""""""""""""""""""
