map <Leader>ec :e C:\Users\acer<cr>
map <Leader>ed :e D:\<cr>
map <Leader>ee :e E:\<cr>
map <Leader>ef :e F:\<cr>
map <Leader>eg :e G:\<cr>
map <Leader>eg0 :e G:\00project\aotuTest_pro<cr>
map <Leader>eg4 :e G:\04py<cr>

""""""""copy current file path""""""""""""""""""
nmap <S-C> :let @+=expand("%:p")<cr>:echo "Copy the current file path is completed!"<cr>
nmap <C-S-C> :let @+=expand("%:p:h")<cr>:echo "Copy the current path is completed!"<cr>
inoremap ll <Esc>
