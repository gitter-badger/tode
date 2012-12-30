as yet unclassified
editElement: aClientElement aspect: aspectSelector label: labelString inWindow: windowIdOrNil at: windowLocation
  | windowId label newWindow win |
  windowId := windowIdOrNil ifNil: [ windowId := self nextAvailableWindowId ].
  windowId == 0
    ifTrue: [ windowId := self nextAvailableWindowId ].
  self currentWindowId: windowId.
  label := labelString.
  newWindow := (self windowStatus windowAt: windowId) isNil.
  (win := self editorWindowAt: windowId) model
    perform: aspectSelector;
    clientElement: aClientElement;
    windowId: windowId;
    label: label.
  newWindow
    ifTrue: [ 
      | bounds |
      bounds := self bounds
        at: windowLocation
        ifAbsent: [ self error: 'Unknown window location: ' , windowLocation printString ].
      win
        extent: bounds extent;
        position: bounds origin ].
  ^ win model