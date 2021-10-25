# purpose of if-else:
# if condition satisfies then only execute the work, else do not exeute


# after "if" () will come which will hold condition 
# then in {} write the code which to be executed when condition in "if" () is satified
# in "else" you directly write in {} without giving any condition in (), because in "else you are not evaluating anything


# example 1:

If (Test-Path "D:\Tech\PowerShell\New folder")
{
New-Item -Path "D:\Tech\PowerShell\New folder" -Name "music.txt" -ItemType File -Force
}
else 
{
Write-Host "path does not exist" -ForegroundColor Red    
}

# executing the above example of if-else statement, first it is checking / testing if the given path is correct
# if path is correct then command inside "if" is executed i.e. music.txt file is created in the given path
# if path is wrong then "else" command will be executed

# simmilarly execute below examples of if-else:


# example 2:

$x = 2
If($x -eq 2)
{
Write-Host "value of x is 2"
}
elseif ($x -eq 3) 
{
Write-Host "value of x is 3"  
}
else 
{
Write-Host "value of x is $x"    
}

# set different values of $x and execute to see the output in above example


# example 3:

$x = Get-Service BITS

if($x.Status -eq "Running")
{
    Stop-Service BITS
}
else
{
    Write-Host "BITS is alredy stopped on this device" -ForegroundColor Yellow
}

<# in $x = Get-Service BITS will so many properties of BITS service
so by using $x.Status we get only status of BITS #>


# example 4: without else

if(-Not ($x.Status -eq "Running"))
{
    Start-Service BITS
}
Get-Service BITS

# -Not to negate the condition