manPages
browseconfigurationsManPage
  | manPage |
  manPage := TDManPage
    commandName: 'configurations'
    fromString:
      'NAME
  browse configurations - List configurations

SYNOPSIS
  browse configurations

DESCRIPTION
  The `browse configurations` command brings up a window on the list of configurations. 

EXAMPLES
  browse configurations
'.
  ^ manPage