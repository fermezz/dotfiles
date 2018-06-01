" Vim color file

hi clear

let colors_name = "codezone"

hi Normal guifg=Black guibg=white

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi IncSearch term=reverse cterm=reverse gui=reverse
hi ModeMsg term=bold cterm=bold gui=bold
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Visual term=reverse cterm=reverse gui=reverse guifg=Grey guibg=fg
hi VisualNOS term=NONE,bold cterm=NONE,bold gui=NONE,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Cursor guibg=Green guifg=NONE
hi lCursor guibg=Cyan guifg=NONE
hi Directory term=bold ctermfg=DarkBlue guifg=Blue
hi LineNr	  term=NONE				 ctermfg=245			  guifg=Brown
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen
hi Search term=reverse ctermbg=Yellow ctermfg=NONE guibg=Yellow guifg=NONE
hi SpecialKey term=bold ctermfg=DarkBlue guifg=Blue
hi Title term=bold ctermfg=DarkMagenta gui=bold guifg=Magenta
hi WarningMsg term=standout ctermfg=DarkRed guifg=Red
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi Folded term=standout ctermbg=Grey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi FoldColumn term=standout ctermbg=Grey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=LightBlue guibg=LightBlue
hi DiffChange term=bold ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan

hi StatusLine	cterm=bold ctermbg=blue ctermfg=yellow guibg=gold guifg=blue
hi StatusLineNC	cterm=bold ctermbg=blue ctermfg=black  guibg=gold guifg=blue
hi NonText term=bold ctermfg=Blue gui=bold guifg=gray guibg=white
hi Cursor guibg=fg guifg=bg

" syntax highlighting
hi PreProc 	term=NONE	cterm=NONE	ctermfg=33	ctermbg=NONE	   
hi Identifier	term=NONE	cterm=NONE	ctermfg=15  	ctermbg=NONE	
hi Comment 	term=NONE   	cterm=NONE	ctermfg=245   	ctermbg=NONE	  
hi Constant	term=NONE	cterm=NONE	ctermfg=40 	ctermbg=NONE	  
hi Special 	term=bold   	cterm=NONE	ctermfg=15  	ctermbg=NONE	   
hi Statement 	term=bold   	cterm=bold	ctermfg=202	ctermbg=NONE   	  
hi Type	  	term=NONE	cterm=NONE	ctermfg=blue	ctermbg=NONE         
hi LineNr 	term=NONE	cterm=NONE	ctermfg=245	ctermbg=NONE	 		  
hi CursorLine 	term=NONE	cterm=NONE	ctermfg=NONE	ctermbg=NONE					    
hi CursorLineNr	term=NONE	cterm=bold	ctermfg=118	ctermbg=NONE	   
hi WildMenu 	term=italic	cterm=underline 	ctermfg=33 	ctermbg=NONE	
hi StatusLine   term=NONE	cterm=NONE		ctermfg=33	ctermbg=NONE
"hi WildMode 	term=bold	cterm=underline 	ctermfg=15 	ctermbg=232	

if exists("syntax_on")
  let syntax_cmd = "enable"
  runtime syntax/syncolor.vim
  unlet syntax_cmd
endif

" vim: sw=2
