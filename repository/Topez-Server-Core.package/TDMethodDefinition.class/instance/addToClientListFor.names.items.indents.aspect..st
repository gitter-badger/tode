as yet unclassified
addToClientListFor: clsDef names: nameList items: items indents: indents aspect: aspect
  | space |
  space := ''.
  (indents at: clsDef) timesRepeat: [ space := space , ' ' ].
  nameList add: (Text string: space , self label attribute: TextEmphasis bold).
  items
    add: (TDClientListItemAttributes object: self parent: nil aspect: aspect)