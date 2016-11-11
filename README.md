"# vimfiles"
v001.000.000
    稳定版本，airline statusline.
v001.000.001
    稳定版本，hightline statusline.
    1，支持yapf格式python代码
       <leader>y format *.py

    2，pep8 格式化，暂不支持，参考资料：
    https://github.com/tell-k/vim-autopep8
    :!autopep8 -i expand("%")
    if has("autocmd")
        autocmd BufWritePost *.py !autopep8 -i expand("%")
    endif
