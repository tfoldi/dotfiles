" $Id: .vimrc,v 1.7 2002/03/13 08:24:36 crow Exp $
"
" crow's vimrc, 2001
" 
syntax on

" autocmd section
autocmd BufEnter *.{lib,fc,pl,pm,c,C,cc,h,H,cpp,php,inc,java,htm,html,xs} set cindent
autocmd BufEnter *.{c,C,c,h,H} call C_init() 
autocmd BufEnter *pico.* set wrap
autocmd BufEnter mutt-* set tw=78
autocmd BufEnter mutt-* call Ekezet_init()
autocmd BufEnter *.{html,xml,htm} call HTML_init()
autocmd BufEnter *.{lib,fc,pl,pm} call Perl_init()
autocmd BufEnter *.{sql} call SQL_init()
autocmd BufEnter Makefile call Build_init()
autocmd BufEnter *.rl set syntax=ragel

" general settings 
set showcmd
set ignorecase
set expandtab
set shiftwidth=2
set ts=2
set tabstop=2
set smarttab
set visualbell
set ttyfast
set backspace=2
set cino=>2
set cinkeys=0{,0},:,0#,!<Tab>,!

set nocompatible	" Use Vim defaults (much better!)
"set bs=4		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
"set tw=78		" always limit the width of text to 78
set nobackup		" keep a backup file
set viminfo='20,\"50	
"set tags=./tags,/opt/hax/src/tags,/encina_dists/2001-12-06/tags,/encina_dists/2001-11-20/tags,/tran2/source/tags,/opt/base_43/tags,./../tags,./../../tags,./../../../tags,./../../../../tags,/encina_dists/2002-01-10/tags
set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,/encina_dists/2002-02-21/FCI-MPI/tags,/encina_dists/2001-11-20/tags
"
" Don't use Ex mode, use Q for formatting
map Q gq
cmap Q q
cmap W w
hi Comment term=bold ctermfg=DarkMagenta guifg=SlateBlue

map <F1> <ESC>@1
map <F2> <ESC>@2
map <F3> <ESC>@3
map <F4> <ESC>@4


" paging
map <F5> <ESC>: previous
map <F6> <ESC>: next

" Help for HTML editing by dLux(C)
" --------------------------------
function HTML_init()
  set nowrap
  " F9: Start a tag
  " F10: Finish the tag
  " F11: Finish the tag + generates a closing tag also!
  " F12: Same as F11, but adds a new line between the start and end tag
"  F9-F12: make a tag from the current word:
"  F9:     <tag>
"  F10:    <tag/>
"  F11:    <tag></tag>
"  F12:    <tag>
"
"          </tag>
  imap <F9> <Space><Space>bi<ea><Right>xxF<f>i
  imap <F10> <Space><Space>bi<ea/><Right>xxF<f><Left>i
  imap <F11> <Space><Space>bdf<Space>i<pi></pi>lxxxF<F<ea
  imap <F12> <Space><Space>bdf<Space>i<pi></pi>lxxxF<i<Up>  <Up>$i

  " F7: Go to the next unfilled attribute
  " F8: Go after the next ">" (breakout) 
  imap <F7> eew<Right>a
  imap <F8> />a
  " F6: Input field declaration
  imap <F6> <input type="OC name="<Right> value="<Right> >bbbbbei
  imap <F5> <!-- **  ** -->bb<Left>i
  imap <C-S-P> part<F12> name="<Right> output="<Right> placeholder="bbbbb<Right>a
  imap <C-S-R> replace<F10> from="<Right> to="<Right>bbb<Right>a
  inoremap " ""<Left>
  inoremap ' ''<Left>
endfunction

function C_init()
  set nowrap
  set syntax=c
"  inoremap ( (moa)<Left>
"  inoremap { {moa}<Up>$ba
"  inoremap [ [moa]<Left>
"  inoremap ) )mi`o%x`ia
"  inoremap } }mi`o%x`ia
"  inoremap ] ]mi`o%x`ia
"  inoremap " ""<Left>
"  inoremap ' ''<Left>
"	set tags=./tags,/opt/hax/src/tags,/tran2/source/tags,/opt/base_43/tags,./../tags,./../../tags,./../../../tags,./../../../../tags,/encina_dists/2001-11-20/tags,/encina_dists/2002-01-10/tags
"	set tags=./tags,/opt/hax/src/tags,/encina_dists/2001-12-06/tags,/encina_dists/2001-11-20/tags,/tran2/source/tags,/opt/base_43/tags,./../tags,./../../tags,./../../../tags,./../../../../tags,/encina_dists/2002-01-10/tags
"
" Don't use Ex mode, use Q for formatting
"
"	nmap ,t osw
"  nmap ,n w:tnw
"  nmap ,, o
"  nmap ,T :!(cd $PROJECT; make tags)
endfunction



function Perl_init()
  set wrap
  set syntax=perl
"  inoremap ( (moa)<Left>
"  inoremap { {moa}<Left>
"  inoremap [ [moa]<Left>
"  inoremap ) )mi`o%x`ia
"  inoremap } }mi`o%x`ia
"  inoremap ] ]mi`o%x`ia
"  inoremap " ""<Left>
"  inoremap ' ''<Left>
"  iab sub sub{<Up>    <Up>$bea
"  iab else else{<Up>    <Up>$bea
"  iab while while (<Right> {<Up>    <Up>$ba
"  iab for for (<Right> {<Up>    <Up>$ba
"  iab foreach foreach (<Right> {<Up>    <Up>$bbea
"  iab iff if (<Right> {<Up>    <Up>$ba
"  iab elsif elsif (<Right> {<Up>    <Up>$ba
  set tags=./perltags,./../perltags,./../../perltags,./../../../perltags
  nmap ,t osw
  nmap ,n w:tnw
  nmap ,, o
  nmap ,T :!(cd $PROJECT; utils/perltags.sh)
endfunction


function SQL_init()
  set nowrap
  inoremap ( (moa)<Left>
  inoremap { {moa}<Left>
  inoremap [ [moa]<Left>
  inoremap ) )mi`o%x`ia
  inoremap } }mi`o%x`ia
  inoremap ] ]mi`o%x`ia
  inoremap " ""<Left>
  inoremap ' ''<Left>
  iab createt create table    (<Right>;<Up><Tab><Up>$<Left>i
  iab creates create sequence;<Left>
  iab dropt   drop   table   ;<Left>
  iab drops   drop   sequence;<Left>
  iab createi create index;<Left>
  iab createu create unique index;<Left>
  iab dropi   drop   index;<Left>
  iab ondc on delete cascade
  iab ondn on delete set null
  iab ondd on delete set default
  iab onuc on update cascade
  iab onun on update set null
  iab onud on update set default
  iab refs references
  iab nn   not null
  set tags=./sqltags,./../sqltags,./../../sqltags,./../../../sqltags
  nmap ,t osw
  nmap ,n w:tnw
  nmap ,, o
  nmap ,T :!(cd $PROJECT; utils/sqltags.sh)
endfunction

function Ekezet_init() 
	imap a' á
	imap e' é
	imap i' í
	imap o' ó
	imap o~ ö
	imap o" õ
	imap u' ú
	imap u~ ü
	imap u" û
	imap A' Á
	imap E' É
	imap I' Í
	imap O' Ó
	imap O~ Ö
	imap O" Õ
	imap U' Ú
	imap U~ Ü
	imap U" Û
endfunction

function Force_indent()
	set cinkeys=0{,0},:,0#,!\<Tab>,!
	imap <C-B> <ESC>:call Soft_indent()<C-M>i
endfunction
function Soft_indent() 
	set cinkeys=0{,0},:,0#,!
	imap <C-B> <ESC>:call Force_indent()<C-M>i
endfunction
call Force_indent()

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

