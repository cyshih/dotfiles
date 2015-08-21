" LaTeX filetype
"	  Language: LaTeX (ft=tex)
"	Maintainer: Srinath Avadhanula
"		 Email: srinath@fastmail.fm

if !exists('s:initLatexSuite')
	let s:initLatexSuite = 1
	exec 'so '.fnameescape(expand('<sfile>:p:h').'/latex-suite/main.vim')

	silent! do LatexSuite User LatexSuiteInitPost
endif

silent! do LatexSuite User LatexSuiteFileType



" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:



" Run LaTeX through TexShop
function! SRJ_runLatex()
    if &ft != 'tex'
        echo "calling srj_runLatex from a non-tex file"
        return ''
    end

    "write the file
    :w

    let thePath = getcwd() . '/'. expand("%")

    let execString = 'osascript -e "tell app \"TeXShop\"" -e "set theDoc to open ((POSIX file \"'.thePath.'\") as alias)" -e "try" -e "tell theDoc to latexinteractive" -e "on error" -e "set theDoc to front document" -e "tell theDoc to latexinteractive" -e "end try" -e "end tell"'

    exec silen! !'.execString
    return ''
endfunction
no  <expr> <D-e> SRJ_runLatex()
vn  <expr> <D-e> SRJ_runLatex()
ino <expr> <D-e> SRJ_runLatex()
