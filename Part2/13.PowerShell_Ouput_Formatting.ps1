# consider below example of pipeline:

Get-ChildItem -Path *.txt | Where-Object{$_.Name -like "*sample*"}

# from output we see that powershell display output in a table format.
# powershell display output in human readable format
# powershell use built in xml files used for formatting
# built in xml files are available in "c:\windows\system32\windowspowershell\v1.0" path

<# 4 cmdlets are there to format the output:

1. Format-Table
2. Format-List
3. Format-Wide
4. Format-Custom

out of the above four, Format-Table and Format-List are mostly used

#>

# 1. Format-Table: To give out of any command in table format

Get-Service BITS | Format-Table

# to check the alias of Format-Table:

Get-Alias -Definition Format-Table

# using Format-Table cmdlet as alias:

Get-Service BITS | ft

# to see the sysntax of Format-Table:

Get-Help Format-Table -Detailed

# using property parameter with Format-Table format:

Get-Service BITS | ft -Property Name,Status

# not using parameters and direcly giving values:

Get-Service BITS | ft Name,Status       # displays the same result as above



# 2.Format-List: To give output of any commandlet in list format

Get-Service BITS | Format-List

# to check the alias of Format-List:

Get-Alias -Definition Format-List

# using Format-List cmdlet as alias:

Get-Service BITS | fl

# to see the sysntax of Format-List:

Get-Help Format-List -Detailed

# using groupby parameter with Format-List:

Import-Csv "D:\Tech\PowerShell\Handsons\Sample.csv" | fl -GroupBy city

# in order to display the output of above cmdlet in sorted form:

Import-Csv "D:\Tech\PowerShell\Handsons\Sample.csv" | Sort-Object city | fl -GroupBy city



# 3.Format-Wide: This also displays output in table format, but displays only one property in wide view

Get-Service | Format-Wide

# to check the alias of Format-Wide:

Get-Alias -Definition Format-Wide

# using Format-Wide cmdlet as alias:

Get-Service | fw

# to see the sysntax of Format-Wide:

Get-Help Format-Wide -Detailed

# using parameter with Format-Wide:

Get-Service | fw -Column 4

# above cmdlet the displays the output in 4 column now. result is divided in multiple columns



# 4.Format-Custom: to display the custom view
# similar to above cmdlets execute below to see the output:

Get-Service | Format-Custom
Get-Process winlogon | Format-Custom
Get-Alias -Definition Format-Custom       # to see its alias
Get-Process winlogon | fc
Get-Help Format-Custom -Detailed          # to see its sysntax
Get-Process winlogon | fc Id,Handles,{$_.CPU*100},SI,Name



# now observe the difference between ft and fl:

Get-Service BITS | ft            # displays 3 properties of BITS service

Get-Service BITS | fl            # displays more (9) properties of BITS service

# the above difference is due to built in xml files
# in xml files it is mentioned that how many properties to show for which formatting cmdlet

<# now in which file the above difference are mentioned, to know this 1st of all we will find out
that get-service is giving which type of object in output #> 

# to get object type of a output of a cmdlet:

Get-Service | Get-Member

# object type is:  System.ServiceProcess.ServiceController
# now we will search that the above object type is present in which xml file:

Select-String -Path "$PSHOME\*format.ps1xml" -Pattern System.ServiceProcess.ServiceController

# from the output we see that the System.ServiceProcess.ServiceController string is present in DotNetTypes.format.ps1xml in 3 places
# open the DotNetTypes.format.ps1xml and see how many properties mentioed to be displayed for Ft and fl

# we can create our own customized xml file too
# built in xml files are digitally signed so they can't be edited
# we need to copy one xml file and then can edit and customize that (example add a new proprty CanStop to ft)
# now once file is customized we need to save it and load it in our current session
# to load customized file in current session:

Update-FormatData -PrepandPath "$PSHOME\<filename>.format.ps1xml"

# to check if the additional property is displaying in the output:

Get-Service BITS | ft

# everytime you use your customized file, you need to load it to your session

# note: if you execute only Get-Service without any formatting, you get output in table format (ft) by default


