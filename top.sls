base:
  'os:windows':
    - match: grain
    - Windows.Defaults
  'os:Amazon':
    - match: grain
    - AWSLinux.Defaults
  'winloginalert:true':
    - match: grain
    - Windows.WinLoginAlert
  'saltmaster:true':
    - match: grain
    - SaltMaster.Default
