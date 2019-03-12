create_test_folder:
  file.directory:
    - name: '/tmp/testfolder'
    - makedirs: True
    - user: ec2-user
    - group: ec2-user
    - dir_mode: 755
    - file_mode: 644
  
install_nmap:
  pkg.latest:
    - name: nmap

install_nano:
  pkg.latest:
    - name: nano
    
