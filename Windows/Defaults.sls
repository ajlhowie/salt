create_test_folder:
  file.directory:
    - name: 'c:\testfolder'
    - makedirs: True

create_temp_folder:
  file.directory:
    - name: 'c:\temp'
    - makedirs: True

create_scripts_folder:
  file.directory:
    - name: 'c:\scripts'
    - makedirs: True

copy_test_file:
  file.managed:
    - name: 'c:\testfolder\testfile.txt'
    - source: salt://testfile.txt

copy_psbeacon_test_file:
  file.managed:
    - name: 'c:\scripts\custombeaconeventidtest.ps1'
    - source: salt://custombeaconeventidtest.ps1

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

disable_firewall:
  win_firewall.disabled:
    - name: allprofiles

install_telnet_client:
  dism.feature_installed:
    - name: TelnetClient

install_snmp_client:
  dism.feature_installed:
    - name: SNMP

lgpo_policy:
  lgpo.set:
    - computer_policy:
        Maximum password age: 60

snmp-agent-settings:
    win_snmp.agent_settings:
        - contact: Aaron Howie
        - location: Mondo

snmp-community-names:
    win_snmp.community_names:
        - communities:
            public: Read Only

create_test_user:
  user.present:
    - fullname: Aaron Howie
    - name: ahowie
    - password: {{ pillar['windows_localadmin'] }}
    - groups:
      - Administrators

install_windows_critical_updates:
  wua.uptodate:
    - severities:
      - Critical
            
