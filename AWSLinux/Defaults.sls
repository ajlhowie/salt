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

install_python3:
  pkg.latest:
    - name: python3

create_test_user:
  user.present:
    - fullname: Aaron Howie
    - name: ahowie
    - groups:
      - wheel
    
