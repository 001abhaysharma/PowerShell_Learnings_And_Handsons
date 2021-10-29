<# 

let us take a condition that we have 2-3 services in our environment and those are very critical
if these services are stopped or in stopped state then we can have significant business loss
we kept this services in our monitoring tool too, if these services are stopped so that we can get alerts / message / email
now let us say that today is weekend and the alert email is missed by us, then?

so answer to this is: powershell script
#>

# -> now creating our first powershell script

# create a text file "servicelist.txt" and write all the services (bits, audisrv, winrm) in that text file that we want to monitor and save it

Get-Content .\servicelist.txt           # executing this, will get you the content of servicelist file in output

# you can also mention the path of the file in above command in case you are not working in current folder

# now, let us store the output of above Get-Content commandlet into a variable

$Services = Get-Content .\servicelist.txt

# now, let us use foreach loop with above commmand

$Services = Get-Content .\servicelist.txt
Foreach ($Service in $Services)     # when foreach loop will execute, so the values stored in $Services variable wil be stored in $Service variable one by one
{
    Write-Host "Checking the status for $Service"       # note: if variables are written in "" then its value will be dosplayed after evaluation. if it is written in '' then it will be read as string. so write variables in "" only in such cases
    $ServStatus = Get-Service $Service | Select Name, Status , Dependent*, CanStop
    # in above line we are checking the status of service. after pipeline we have mentioned what properties we want in output while executing the above pipeline commandlet. and then we are storing the output in the $ServStatus variable     
    # note: * is used for wildcard entry. add * in case you don't want to write full name 

    # now if the status of service is stopped then only we need to take action, else no action. for this we will use "if-else"
    If ($ServStatus.status -eq "Stopped")     # from the above properties like name, status, etc. here we are checkling only the status property stored in the $ServStatus variable
    #  -eq (equal to) is comparison operator
    {
        Write-Host "$Servcie was stopped. Starting the service" -ForegroundColor Red
        Start-Service $Service -ErrorVariable err
        # in above line we are starting the service. in case any error comes then that error will store in ErrorVariable
    }

    else {
        Write-Host "$Service is already running." -ForegroundColor Green
    }

}

# once the script is prepared, save it



# find the clean script below and execute it and see the output:

$Services = Get-Content .\servicelist.txt
Foreach ($Service in $Services)
{
    Write-Host "Checking the status for $Service"
    $ServStatus = Get-Service $Service | Select Name, Status , Dependent*, CanStop

    If ($ServStatus.status -eq "Stopped")
    {
        Write-Host "$Servcie was stopped. Starting the service" -ForegroundColor Red
        Start-Service $Service -ErrorVariable err
    }

    else 
    {
        Write-Host "$Service is already running." -ForegroundColor Green
    }

}   


# note: you can add `n before the line "Checking status..." so that the status of the next service can be shown in next / new line. execute modified script below and see:

$Services = Get-Content .\servicelist.txt
Foreach ($Service in $Services)
{
    Write-Host "`nChecking the status for $Service"
    $ServStatus = Get-Service $Service | Select Name, Status , Dependent*, CanStop

    If ($ServStatus.status -eq "Stopped")
    {
        Write-Host "$Servcie was stopped. Starting the service" -ForegroundColor Red
        Start-Service $Service -ErrorVariable err
    }

    else 
    {
        Write-Host "$Service is already running." -ForegroundColor Green
    }

} 


# if your all services are already running, then try to stop any one of them, execute the script and see the result.
# to stop any service: Stop-Service winrm
# above script can be scheduled in a task schedular and we can give a interval of 1 min