<#
Run this command first!
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

Description
This will need to be run each time the ISE is launched to get allow for script testing.

Command
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope LocalMachine

Description
Resets the script execution policy to restricted at the local machine scope.

General Notes
Next steps

Near term
Test and see if the results are useful for the team.

1. Verify that devices and printers contains the peripheral information needed.

3. ????

4. Profit!


Old approach
Get-CIMInstance -ClassName CIM_LogicalDevice | Select-Object name, description, deviceID | where-object {$_.description -match 'USB'} | Export-CSV -path C:\BankOnIt\$Path`.csv
#>


#Define the required variables for the script
$HN = hostname
$DateRan = (get-date).ToString("MM-dd-yyyy")
$folderName = "Blade Programming"
$Path1 = "C:\" + $folderName
$Path2 = $DateRan + " " + $HN + " Attached Printers Report"


#Test for the existance of the folder defined in $folderName and create the folder if no folder exists.

if (!(Test-Path $Path1))
{
    New-Item -ItemType Directory -Path C:\ -Name $folderName
}


get-printer | Select-Object name, DriverName, PortName | Export-CSV -path C:\$folderName\$Path2`.csv