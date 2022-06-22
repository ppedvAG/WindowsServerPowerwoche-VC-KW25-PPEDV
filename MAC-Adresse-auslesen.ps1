$Computers = (Get-ADComputer -Filter {enabled -eq $true} -Property Name).Name

$result = ForEach ($Computer in $Computers){
    If (Test-Connection -Quiet -Count 1 -Computer $Computer){
        [PSCustomObject]@{
            ComputerName = $Computer
            MAC = (Invoke-Command {
                     (Get-WmiObject Win32_NetworkAdapterConfiguration -Filter 'ipenabled = "true"').MACAddress -Join ', '
                  } -ComputerName $Computer)
            Online = $True
            DateTime = [DateTime]::Now
        }
    } Else {
        [PSCustomObject]@{
            ComputerName = $Computer
            MAC = ''
            Online = $False
            DateTime = [DateTime]::Now
        }
    }

}
$result | Export-Csv C:\Users\administrator\Desktop\Computers.csv -Delimiter ";" -NoTypeInformation