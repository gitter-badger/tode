as yet unclassified
directoryEntry: aDirectoryEntry
  | fsNode |
  fsNode := self new
    name: aDirectoryEntry name;
    directoryEntry: aDirectoryEntry;
    yourself.
  ^ (aDirectoryEntry name endsWith: self stonFileExtension)
    ifTrue: [ self fileSystemProxy: fsNode ]
    ifFalse: [ fsNode ]