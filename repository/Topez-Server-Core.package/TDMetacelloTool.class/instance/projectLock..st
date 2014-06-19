project api
projectLock: registration
  | selector metacello |
  selector := registration projectSelector.
  metacello := Metacello new.
  metacello perform: selector with: registration projectName.
  metacello repository: registration repositoryDescription.
  registration projectSpec hasClassName
    ifTrue: [ metacello className: registration projectSpec className ].
  registration isConfigurationBased
    ifTrue: [ metacello version: registration versionString ].
  ^ metacello lock