manPages
methodremoveManPage
  | manPage |
  manPage := TDManPage
    commandName: 'remove'
    fromString:
      'NAME
  method remove - Remove method

SYNOPSIS
  method remove <method-spec>...

DESCRIPTION
  The `method remove` removes the specified method.

EXAMPLES
  method remove Dictionary>>at:put: 
  method remove Dictionary class>>new:
'.
  ^ manPage