" Vim syntax file
" Language:    Apricos Assembler
" Maintainer:  Nick Stones-Havas <nick@drdanick.com>
" Last Change: 2017 Feb 25
" Revision:    2

" For version 5.x: Clear all syntax items
" For version 6.0 and later: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore


syn match apricosLabel      "^\s*[a-zA-Z_][a-zA-Z0-9_\-]*:"
syn match apricosDirective  "\.[a-z]\+"

" String formats
syn match apricosSpecialChar contained "\\\([\\nr\"\'\0]\|$\)"
syn region apricosSingleString start=/'/ skip=/\\'/ end=/'/ contains=apricosSpecialChar
syn region apricosDoubleString start=/"/ skip=/\\"/ end=/"/ contains=apricosSpecialChar

" Number formats
syn match decNumber "\<[0-9]\+\>"
syn match octNumber "\<o[0-7]\+\>"
syn match hexNumber "\<0\{,1}x[0-9a-fA-F]\+\>"
syn match binNumber "\<b[0-1]\+\>"

syn keyword apricosTodo contained TODO

" Line comments all start with ';'
syn match apricosComment ";.*" contains=apricosTodo


syn keyword apricosInstruction ADD 
syn keyword apricosInstruction NOT 
syn keyword apricosInstruction AND 
syn keyword apricosInstruction OR 
syn keyword apricosInstruction XOR 
syn keyword apricosInstruction SHFl SHFr 
syn keyword apricosInstruction LD LDal LDah 
syn keyword apricosInstruction LDI 
syn keyword apricosInstruction ST STal STah 
syn keyword apricosInstruction STI 
syn keyword apricosInstruction SPUSH SPOP
syn keyword apricosInstruction LA LAl LAh LAR LARl LARh
syn keyword apricosInstruction BR BRn BRz BRp BRnz BRnp BRzp BRnzp JMP
syn keyword apricosInstruction PRTin PRTout 
syn keyword apricosInstruction ASET 
syn keyword apricosInstruction NOP


" Storage types
syn match apricosType "\.nearptr\>"
syn match apricosType "\.segptr\>"
syn match apricosType "\.farptr\>"
syn match apricosType "\.fill\>"
syn match apricosType "\.blockw\>"
syn match apricosType "\.stringz\>"
syn match apricosType "\.padseg\>"

" Assembler directives
syn match assemblerDirective "\#name\>"
syn match assemblerDirective "\#segment\>"
syn match assemblerDirective "\#include\>"
syn match assemblerDirective "\#macro\>"

syn case match

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_asm_syntax_inits")
  if version < 508
    let did_asm_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink apricosLabel         Label
  HiLink apricosComment       Comment
  HiLink apricosTodo          Todo
  HiLink apricosDoubleString  String
  HiLink apricosSingleString  String
  HiLink apricosSpecialChar   SpecialChar
  HiLink hexNumber            Number
  HiLink decNumber            Number
  HiLink octNumber            Number
  HiLink binNumber            Number
  HiLink apricosInstruction   Identifier
  HiLink apricosType          Type
  HiLink apricosDirective     Statement
  HiLink assemblerDirective   PreProc

  delcommand HiLink
endif

let b:current_syntax = "apricos"
