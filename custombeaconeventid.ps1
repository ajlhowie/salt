param (
    [string]$eventid = $(throw "-eventid is required."), 
    [string]$timewindow = -10,    
    [string]$eventlogtype = $(throw "-eventlogtype is required."),
    [string]$logfile = "c:\temp\custombeaconeventidlog.txt"
)


$fireevent = "salt-call event.send " + ($env:computername).ToString() + "/customevent/powershell/eventid/" + $eventid.ToString() + " ''"

$date = Get-Date

try
{

    (Get-Date).ToString() + " - Checking eventlogs for event " + $eventid.ToString() | Out-File -FilePath $logfile -Append

    $eventmatch = get-winevent -Logname $eventlogtype | where id -eq $eventid | where timecreated -gt $date.addminutes($timewindow)

    (Get-Date).ToString() + " - Finished checking eventlogs " + $eventid.ToString() | Out-File -FilePath $logfile -Append

}
catch
{

    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName

    (Get-Date).ToString() + $ErrorMessage | Out-File -FilePath $logfile -Append

    (Get-Date).ToString() + $FailedItem | Out-File -FilePath $logfile -Append

}

if($eventmatch -ne $null)
{

    try
    {

        (Get-Date).ToString() + " - Trying to fire event" | Out-File -FilePath $logfile -Append

        Invoke-Expression -Command $fireevent

        (Get-Date).ToString() + " - Successfully fired event" | Out-File -FilePath $logfile -Append

    }
    catch
    {

        $ErrorMessage = $_.Exception.Message
        $FailedItem = $_.Exception.ItemName

        (Get-Date).ToString() + $ErrorMessage | Out-File -FilePath $logfile -Append

        (Get-Date).ToString() + $FailedItem | Out-File -FilePath $logfile -Append

    }

}

