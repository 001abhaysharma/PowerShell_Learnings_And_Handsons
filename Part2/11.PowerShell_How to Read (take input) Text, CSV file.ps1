<#

to read / take inputs from text and csv files, use below commandlets:

1. Get-Content
2. Import-Csv
3. Read-Host

#>

# to read / get the content of any text file, we use: Get-Content

# excute below to see, the content of a sample text file having any values:
# (first create a sample.txt file with any text value inside it)

Get-Content -Path D:\<path>\sample.txt

# or if you are in the same folder where the sample.txt file exists, then execute as below:

Get-Content .\sample.txt

# now to store the content of above file in any variable (first you get output from above and then storing that output to a variable)

$Text = Get-Content -Path D:\<path>\sample.txt

# or

$Text = Get-Content .\sample.txt

# executing above command will store the output from right hand side commandlet to the left hand side variable

# execute the above created variable to see the output:

$Text

# to read the data of a csv file, we use: Import-Csv

Import-Csv .\sample.csv
Import-Csv -Path D:\<path>\sample.csv   # gives the same output as above
# (first create any csv file with name sample.csv having values like name, city, etc)

# output of above command is displayed in a table format having columns (depending on csv data)
# by default it gives the output in "Format-Table" format, exaple:

Import-Csv .\sample.csv | Format-Table     # gives the same output as above 2 commands

# (Format-Table is also a commandlet)

# if we want to change the formating of output of above command and want the data in list format, then execute below:

Import-Csv .\sample.csv | Format-List

# to display the values of any single column from the data in csv file, execute below:

Import-Csv .\sample.csv | Select-Object Name
Import-Csv .\sample.csv | Select-Object City

# to store the output values of Import-Csv command in any variable, then execute below:

$csv = Import-Csv .\sample.csv

# execute below to call the stored values of above variable:

$csv

# to get an interactive input from user and then to do action on it, use: Read-Host commandlet

Read-Host "Please enter your name"  

# execute above to see the output, you see ":" will automatically come. you need to give input to the above command (i.e. your name). then you can see the same input in the console output

# now to store the input in a variable, that you give to the above command, execute below:

$ReadHost = Read-Host "Please enter you name"

# call the $Readhost variable created above to see the value stored:

$ReadHost

