# alias are short form of commandlets

# examples:

# to see the list of items available in a folder, execute below:

Get-ChildItem

# same output can be achieved by using below:

ls
dir
gci

# ls, gci and dir are alias of Get-ChildItem

# to see alias of any commandlet, execute below:

Get-Alias -Definition Get-ChildItem

# ? is the alias of Where-Object
# h is the alias of Get-History

# to know more about the Get-Alias commandlet, execute below:

Get-Help Get-Alias