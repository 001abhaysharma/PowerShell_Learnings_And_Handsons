<#

in any computer language, operators provide a means of comparing and manipulating pieces of data

powershell offers wide variety of operators for different task

#>


<#

1. logical and comparison operators:

comparison operators are designed to take 2 pieces of data and compare them
they always return either true or false

# note: powershell has built in variables: $true and $false that represent the boolean values true and false

powershell primary comparison operators:

-eq   equal to
-ne   not equal to
-gt   greater than
-lt   less than
-le   less than or equal to
-ge   greater than or equal to
-like, -notlike     wildcard string comparison

#>


# 1.1 equal to (-eq) and not equal (-nq) operators:

# string comparison using -eq and -nq examples :

"Hello" -eq "Hello"   # output is true
"Hello" -eq "hello"   # output is true
"Hello" -eq "Abhay"   # output is false
"Hello" -ne "Abhay"   # output is true


# 1.2 -like and -not like operators:

# string comparison using -like and -notlike examples :

"PowerShell" -like "*sh*"   # output is true
"PowerShell" -notlike "*sh*"  # output is false


# note: all string comparisons are case-insensitive by default

# examples:

"Hello" -eq "Hello"   # output is true
"Hello" -eq "hello"   # output is also true

# in order to make string comparison from case-insensitive to case-sensitive add "c" to the operator: ex.  -ceq, -cnq and so on

"Hello" -ceq "hello"  # output is false

# in order to force a case-insensitive comparison, add "i" to the operator: ex. -ieq, -inq, and so on

"Hello" -ieq "hello"   # output is true

# though string comparison is case-insensitive by default, -ceq -cnq -ieq -inq can be used when you have to perform multiple comparisons, some have to case-sensitive some have to be case-insensitive

# similarly to make -like and -notlike operator from case-insensitive to case-sensitive: -clike and -cnotlike
# example: 

"PowerShell" -clike "*sh*"  # output is false
"PowerShell" -clike "*Sh*"  # output is true