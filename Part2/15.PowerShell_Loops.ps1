# loop: when a task or process runs in cycle

<# 

in programming language, we use loops when we want our code to be executed 
to a certain number of times till the condition is matched

#>

<#
types of loops:

1. For Loop
2. Foreach
3. Foreach-Object
4. While
5. Do-While
6. Do-Until

#>


# 1. For Loop:

# below is one example:

for ($i = 1; $i -lt 10; $i++)
{
    $i
}

# note: lt is alias of less than

# to make a table of 2, execute below:

$j = 2
for ($i = 1; $i -le 10; $i++)
{
    $i*$j
}

# note: le is alias of less than or equal to


# 2.Foreach:

notepad .\servicelist.txt    #this will create a new notepad file in current folder

# inspite of .\ you can also mention the "\<path>\ if you want to create a file in perticular location
# so file servicelist is created. put 3-4 service names in it and save

$Services = Get-Content .\servicelist.txt
foreach ($Item in $Services)
{
    Write-Host "The status of the $Item is $((Get-Service $Item).Status)"
}


# 3. Foreach-Object:

# when you want to perform small operation then use Foreach-Object
# when you want to perform multiple condition operations in {} then use Foreach

Get-Content .\servicelist.txt | Foreach-Object {Get-Service $_}

# note: $_ is an automatic variable


# 4. While loop:

# if you want the loop to run continuously untill the condition is met

$x = 0
while ($x -lt 10)
{
    $x
    $x++
}


# 5. Do-While:

<# 

first code should run, then condition should be checked 
if condition satisfied then loop will continue otherwise loop will break

#>

$x = 5
do
{
    $x
    $x--
}
while ($x -gt 0)


# Do-Until

<#
main difference between do-while and do-until:

in do-while loop executes till the time conditon is true
in do-until loop executes till the time condition is false

#>

$x = 5
do
{
    $x
    $x--
}
until ($x -gt 0)