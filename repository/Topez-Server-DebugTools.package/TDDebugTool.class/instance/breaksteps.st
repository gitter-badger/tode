commands
breaksteps
  "
  break steps <method-ref>...
"

  self getSubcommandOptsMixedLongShort: {}.
  subArguments
    do: [ :methodRef | 
      | meth |
      meth := (methodRef beginsWith: '@')
        ifTrue: [ self resolveAtPathReference: methodRef ]
        ifFalse: [ self methodFromMethodSpec: methodRef ].
      self browseStepPoints: meth ]