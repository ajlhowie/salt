create_test_folder:
  file.directory:
    - name: 'c:\testfolder'
    - makedirs: True

install_chocolatey:
  cmd.run:
    - name: 'iex ((New-Object System.Net.WebClient).DownloadString("https://chocolatey.org/install.ps1")); SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"'
    - shell: 'powershell'
    - creates: 'C:\ProgramData\chocolatey\bin\chocolatey.exe'

disable_ieesc:
  cmd.run:
    - name: 'Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value 0;Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value 0;Stop-Process -Name Explorer'
    - shell: 'powershell'

install_putty:
  chocolatey.installed:
    - name: putty

install_nmap:
  chocolatey.installed:
    - name: nmap

install_notepadplusplus:
  chocolatey.installed:
    - name: notepadplusplus
