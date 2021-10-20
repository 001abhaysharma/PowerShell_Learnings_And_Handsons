<# powershell pipeline:

definition: a pipeline is a series of commands connected by pipeline operators ( | )
each pipeline operator sends the results of the preceding command to the next command 

#>


# execute example below

Get-Service -Name BITS

Get-Service -Name BITS | Stop-Service       # here Get-Service and Stop-Service are in pipeline

Get-Service -Name BITS

Get-Service -Name BITS | Start-Service

Get-Service -Name BITS

# execution in pipeline happens from left to write   --------------->------------>------------->
# <-----commandlet1-------><--pipe---><------commandlet2----->
# pipleline operator "|" takes output of L.H.S. commandlet and passes it to R.H.S. commandlet as input

<# conditions which are checked before assigning the object to commandlet:

1. the parameter must accept the input from a pipeline
2. the parameter must accept the type of object being sent or a type that the object can be converted to
3. the parameter must not already be used in the command

#>

# powershell cmdlets give the output in the form of a object (not in string or text form)
# to see the output type execute below:

(Get-Service).GetType()

# benefit of pipeline operator:
# 3 line of code is reduced to one line.
# compute is less utilised and time is taken less to execute, script is efficient
# see the example below:

$textfilter = Get-Childitem -Path *.txt
$textfilter = $textfilter | Where-Object{$_.Name -like "*sample*"}
$textfilter | Select-Object -Property name

# execute above 3 line of code as all together
# in 1st line, it is checking the .txt file in a perticular path and storing it in variable
# in 2nd line, in the variable it is checking those files having name as sample (in the perticular location given above)
# in 3rd line, it is giving output
# (for executing above command you can create text file with "sample" name put any values inside)

#now the above 3 line code gives same output as below 1 line code

Get-Childitem -Path *.txt | Where-Object{$_.Name -like "*sample*"} | Select-Object -Property name


# now to check if the commmadlet parameter accepts input from a pipeline or not, execute below:

Get-Help Stop-Service -Parameter Name   # in console output you can see whether "Accept pipeline input = true or false"
Get-Help Stop-Service -Parameter *
Get-Help Stop-Service -Full

# from output you see that the "Accept pipeline input?" is "True".

<# Commandlets parameters can accept pipeline input in one or two different ways

1.ByValue
2.ByPropertyValue

ByValue: Parameters that accept input "by value" can accept piped objects that have the same .NET
type as their parameter value or objects that can be converted to that type.

ByPropertyValue: Parameters that accept input "by property value" can accept piped objects only
when a property of the object has the same name as the parameter. 

#>

# if any commandlet fails because of a pipeline error, then you can investigate the error using below commandlet and rewrite the command

Trace-Command -Name ParameterBinding -Expression {Get-Process -Name Notepad | Stop-Process} -PSHost -FilePath debug.txt

# -PSHost will give the output in a debug.txt file and debug.txt file will be saved in the current directory

# in powershell pipeline processing happens item by item