menu actions (git)
gitPullProjectMenuAction: listElement selectionIndex: selectionIndex
  | registration gitRepoDirectory gitTool response |
  selectionIndex = 0
    ifTrue: [ ^ false ].
  registration := self projects at: selectionIndex.
  gitRepoDirectory := self projectTool gitRepoDirForRegistration: registration.
  gitTool := self gitTool.
  response := gitTool
    gitpullIn: gitRepoDirectory
    with: 'origin ' , registration currentBranchName.
  response
    editUsing:
      ((TDEditorSpec topez: topez editorAspect: #'edit')
        windowName: #'gitStatus';
        yourself).
  ^ #'refreshView'