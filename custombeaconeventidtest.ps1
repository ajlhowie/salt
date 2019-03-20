$fireevent = "salt-call event.send " + ($env:computername).ToString() + "/customevent/powershell/eventid/" + "4264" + " ''"

Invoke-Expression -Command $fireevent

        

