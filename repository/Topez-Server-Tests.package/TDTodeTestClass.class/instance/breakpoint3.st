as yet unclassified
breakpoint3
  "called by breakpoint2 ... "

  | tmp |
  tmp := 3 + 4.	"second breakpoint @2"
  tmp := tmp + 3.
  ^ tmp