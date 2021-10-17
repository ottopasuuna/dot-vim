
let scheme_autopairs = {'(':')', '[':']', '{':'}','"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
au BufRead *.scm let b:AutoPairs = scheme_autopairs
au BufRead *.rkt let b:AutoPairs = scheme_autopairs
au BufRead *.clj* let b:AutoPairs = scheme_autopairs
