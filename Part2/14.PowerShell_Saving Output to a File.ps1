# now we will see how we can save a output in powershell to a file

# Out-File is commandlet to save output in a file:

Get-Service | Out-File -FilePath .\servicestatus.txt

# executing above command will save the output of Get-Service to a servicestatus.txt file
# servicestatus.txt file will saved in current working folder in which we are working (as we are using .\ )
# if you want to save the servicestatus.txt file to any other location then you can mention the path:  -FilePath "D:\<path>\..."
# open the servicestatus.txt file and see results

# if we need any perticular property in the output to be saved (while executing above command), then execute below:

Get-Service | Select-Object -Property Name,status | Out-File -FilePath servicestatus2.txt

# open the servicestatus2.txt file and see results
# note: in above command we did not add ".\" in front of file then also file saved in our current working folder


# to convert the results of above command to html and save it in the html file, execute below:

Get-Service | Select-Object -Property Name,status | ConvertTo-Html | Out-File servicestatus.html

# in above command we did not even use -FilePath parameter, then also file got saved in the current folder.
# hence use of -FilePath can be avoided, if you want the file to be saved in current folder. execute below to see:

Get-Service | Select-Object -Property Name,status | Out-File servicestatus3.txt

<# 
if you are running the command to save output to text or html file (as shown above) 
and saving the output to a file name "servicestatus.txt" or "servicestatus.html" and
if any file with same name already exists and you don't want to overwrite it
then use -NoClobber commandlet 
#>

# execute below to see the example:

Get-Service | Select-Object -Property Name,status | ConvertTo-Html | Out-File servicestatus.html -NoClobber
Get-Service | Select-Object -Property Name,status | Out-File servicestatus.txt -NoClobber

# executing above command will throw an error saying "file already exists"


# to export output to .csv file we use Export-Csv commandlet:

Get-Service | Export-Csv servicestatus.csv

# executing above will save the output to servicestatus.csv file
# opening servicestatus.csv file we see in the header object type is also visible: "TYPE System.ServiceProcess.ServiceController". this happens when save output to csv file
# if you dont want the object type in the csv file then excute below:

Get-Service | Export-Csv servicestatus2.csv -NoTypeInformation
Get-Service | select Name,status | Export-Csv servicestatus3.csv -NoTypeInformation   # if you need specific properties in the output

# to export output to xml file we use Export-Clixml commandlet:

Get-Service | Export-Clixml servicestatus.xml