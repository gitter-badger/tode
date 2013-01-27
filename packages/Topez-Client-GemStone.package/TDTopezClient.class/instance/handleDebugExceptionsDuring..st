as yet unclassified
handleDebugExceptionsDuring: aBlock
  | result |
  [ result := aBlock value ]
    on: TZTopezBreakpointNotification , TZTopezHaltNotification , TZTopezErrorNotification
    do: [ :ex | 
      | errorNumber |
      (ex isKindOf: TZTopezErrorNotification)
        ifTrue: [ 
          "error occurred during execution"
          ^ #'error' ].
      errorNumber := ex exceptionProxy number asTopezNative.
      errorNumber = 6002
        ifTrue: [ 
          "single step breakpoint ... as expected"
          ^ #'singleStep' ].
      errorNumber = 6005
        ifTrue: [ 
          "method breakpoint"
          ^ #'breakpoint' ].
      errorNumber = 2709
        ifTrue: [ 
          "halt occurred during execution"
          ^ #'halt' ].
      errorNumber = 6006
        ifTrue: [ 
          "return from method or block breakpoint ... as expected"
          ^ #'blockOrMethodReturn' ].
      self error: 'another breakpoint error number?' ].
  ^ result