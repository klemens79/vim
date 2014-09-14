function! GnuIndent()
    setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
    setlocal shiftwidth=2
    setlocal tabstop=8
    setlocal noexpandtab
endf

function! CIndent()
    setlocal cinoptions=:0,g0,(0,W4
    setlocal shiftwidth=2
    setlocal tabstop=2
    setlocal expandtab
    highlight rightMargin term=bold ctermfg=red guifg=red
    match rightMargin /.\%>81v/
endf

function! PyIndent()
    setlocal cinoptions=
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal expandtab
    highlight rightMargin term=bold ctermfg=red guifg=red
    match rightMargin /.\%>81v/
endf

if has("autocmd")
    au FileType c,cpp call CIndent()
    au FileType python call PyIndent()
endif

