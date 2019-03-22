copy_psbeacon_file:
  file.managed:
    - name: 'c:\scripts\custombeaconeventid.ps1'
    - source: salt://custombeaconeventid.ps1

scheduled_task_psbeacon_login:
  cmd.run:
    - name: 'schtasks /create /sc minute /mo 1 /tn "custombeaconeventid4624" /tr "Powershell.exe -file C:\scripts\custombeaconeventid.ps1 -eventid 4624 -timewindow -2 -eventlogtype security" /ru system'
    - shell: 'powershell'