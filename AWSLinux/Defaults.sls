create_test_folder:
  file.directory:
    - name: '/tmp/testfolder'
    - makedirs: True
    - user: ec2-user
    - group: ec2-user
    - dir_mode: 755
    - file_mode: 644

copy_test_file:
  file.managed:
    - name: '/tmp/testfolder/testfile.txt'
    - source: salt://testfile.txt
    - user: ec2-user
    - group: ec2-user
    - mode: 644
  
install_nmap:
  pkg.latest:
    - name: nmap

install_nano:
  pkg.latest:
    - name: nano

install_python3:
  pkg.latest:
    - name: python36

install_pyinotify:
  pkg.latest:
    - name: python-inotify
    
