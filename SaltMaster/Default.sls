copy_master_config_file:
  file.managed:
    - name: /etc/salt/master
    - source: salt://master
    - user: ec2-user
    - group: ec2-user
    - mode: 644

restart_salt_master:
  service.running:
    - name: salt-master
    - watch:
      - file: /etc/salt/master