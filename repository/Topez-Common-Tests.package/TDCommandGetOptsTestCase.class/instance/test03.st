as yet unclassified
test03
  | parser options processedOption |
  options := Dictionary new
    add: $a -> nil;
    add: $b -> nil;
    yourself.
  parser := TDCommandGetOpts parseCommand: (ReadStream on: 'testopt -ab').
  self assert: parser command = 'testopt'.
  processedOption := false.
  parser
    getOpts: 'abc:'
    do: [ :opt :optArg | 
      processedOption := true.
      self assert: (options at: opt) = optArg ]
    nonOptionsDo: [ :nonOption | self assert: false ].
  self assert: processedOption