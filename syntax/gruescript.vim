" Vim syntax file
" Language: Gruescript (.gru)
" Maintainer: David Yates
" Latest Revision: 2021-10-07

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword grueBlock game room thing rule proc verb setverb var tagdesc
syn keyword grueProp author version id person intro name desc verbs cverbs loc dir tags examine wait conversation show_title instructions display prompt prop pronoun colour color localise localize
syn keyword grueDir north northeast northwest east southeast south southwest west northwest up donw in out fore aft port starboard
syn keyword grueAssert held carried worn inscope visible here at thingat near eq is gt lt has hasany hasall taghere isthing isroom chance try js
syn keyword grueCommand say sayat write assign freeze add hide bring give carry wear unwear unhold swap die tag untag tagroom untagroom put putnear goto open close random count pick continue run log status
syn keyword grueSpecialProp start portable lightsource wearable worn alive male female nonbinary plural proper_name dark quiet list_last cantsee score maxscore maxinv inv on off things rooms tagged dirs these intransitive
syn keyword grueSequence all select sequence

" Dereferenced vars
syn match grueDeref '\v\$\w+'

" Interpolation
syn region grueInterp start='{' end='}' keepend contained contains=grueDeref matchgroup=SpecialChar

" Strings
syn region grueString
      \ start='\v((js|say|display|prompt|desc|:|game|author|status) )@<=' skip='\\' end='\v\n' keepend
      \ contains=grueInterp,grueComment

syn region grueStringAfter
      \ start='\v((write|prop|locali[sz]e|colou?r|thing|room) [A-Za-z0-9\.\$_]+ )@<=' skip='\\' end='\v\n' keepend
      \ contains=grueInterp,grueComment

" Numbers
syn match grueInteger '\v<-?\d+>'

" Comments
syn region grueComment start='\v#' end='\v$' keepend

" Highlighting groups
hi def link grueBlock         Function
hi def link grueProp          Type
hi def link grueDir           Special
hi def link grueAssert        Conditional
hi def link grueCommand       Statement
hi def link grueSpecialProp   Special
hi def link grueSequence      Repeat
hi def link grueDeref         Constant
hi def link grueInteger       Constant
hi def link grueComment       Comment
hi def link grueString        String
hi def link grueStringAfter   String
hi def link grueInterp        Special

let b:current_syntax = "gruescript"
