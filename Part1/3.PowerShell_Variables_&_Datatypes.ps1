<#

variable:

variable is a symbolic name given to computer memory location holding a value in it

in simple words, they are basically memory locations which can hold a value

in powershell we denote variable by $ sign / symbol


data types:

a datatype is a classification of the type of data that is stored in variable


in computer programmimg languages there are below types of data types:

[int] -> 32 bit signed integer
[long] -> 64 bit signed integer
[string] -> fixed length string of unicode characters
[char] -> unicode 16 bit character
[bool] -> true / false value
[double] -> double - precison 64-bit floating point number
[decimal] -> 128-bit decimal value
[single] -> single - precison 32-bit floating point number
[array] -> array of values
[xml] -> xml document object
[hashtable] -> hashtable object

#>


# to create a variable and store a value in it, execute below:

$var = "Abhay"

# to call the value stored in above created $var variable, execute below:

$var

# to get the datatype of the above variable, execute below:

$var.GetType()

# from output we see that the $var has string datatype

# to make a int variable, then execute below:

[int]$Num = 10

# to call the value stored in above created $Num variable, execute below:

$Num

# to get the datatype of the above variable, execute below:

$Num.GetType()

# from output we see that the $Num has Int32 datatype

# now if you want to store any string value in $Num, then it won't. it will give you error. to see execute below:

$Num = "Sharma"

# if you execute above you will get an error. because you have restricted it (by putting [int] in the beginning) to store Int value only.

# now if you assign an int value to the variable without adding [int] in the beginning, then it will store the integer value.
# and if you assign a string value to the same variable, then it will store without any error.
# because you have not restricted this variable by putting [int] in the beginning
# execute below to see:

$Num2 = 20

$Num2

$Num2 = "Sharma"

$Num2

# to store decimal value in the varible, execute below:

[double]$Num3 = 10.5

# to call the value stored in above created $Num variable, execute below:

$Num3

# note: if you dont put [double] and assign 10.5 to variable directly like $Num3 = 10.5, then it will only store 10 and not .5. execute below to see.

$Num4 = 10.5
$Num4

# however executing above, we see $Num4 is storing 10.5 without adding [double]

# to give space in the variable name, execute below:

${Say Hello} = "Hello Mr"

# to call the value stored in above created variable (having space in between two words), execute below:

${Say Hello}

# to store multiple values in the variable:

[array]$values = @("Abhay","Swapnil","Geet")

# to call the value stored in above created variable, execute below:

$values

# to call value stores in above variable one by one according index place, execute below:

$values[1]
$values[0]
$values[2]

# this is how you can call the sigle object stored in array

# in [hastable] values are stored in key - pair format, to see example excute below:

[Hashtable]$hashtable = @{Name="Abhay";Roll=10}

# to call the value stored in above created variable, execute below:

$hashtable

# now execute below to see output:

$hashtable.keys
$hashtable.Name
$hashtable.Roll

# for boolean variable, execute below:

[bool]$bool = $true
$bool
[bool]$bool2 = $false
$bool2
$bool.GetType()

$bool = "Abhay"     # will throw error
$bool2 = "Abhay"    # will throw error


# all above created variables are user created variables. they will be lost once session is closed.

# now let's see automatic variable.

$psversiontable          # these are automatically created and can be modified by powershell only. this variable shows version of powershell.

# now let's see preference variable.

$ErrorActionPreference    # used in case if any error occurs in code / script, then what to do. to continue the code / script or to stop code there itself?

# if you execute above variable then by default value of above variable is coming as "continue", which can be modified. however when you close the session, value again set to continue.

# now let's see environment variables.

$env:SystemRoot          # execute it to see the output.

# all these above variables are stored in virtual drive of Powershell.

# to see powershell vertual drive, execute below:

Get-PSDrive

# from output of above, you see env. variable are stored in "Environment drive" and user created variable are stored in "Variable drive"

# enter into "Variable drive" and see all variables that we created:

dir Variable:      

# by executing above, this is we can enter into any drive