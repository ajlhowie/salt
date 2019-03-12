create_test_folder:
  file.directory:
    - name: '/tmp/testfolder'
    - makedirs: True
    - user: ec2-user
    - group: ec2-ser
    - dir_mode: 755
    - file_mode: 644
