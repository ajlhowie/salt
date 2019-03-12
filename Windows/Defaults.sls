create_test_folder:
  file.directory:
    - name: 'c:\testfolder'
    - makedirs: True

install_chocolatey:
  cmd.run:
    - name: 'iex ((New-Object System.Net.WebClient).DownloadString("https://chocolatey.org/install.ps1")); SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"'
    - shell: 'powershell'
    - creates: 'C:\ProgramData\chocolatey\bin\chocolatey.exe'
