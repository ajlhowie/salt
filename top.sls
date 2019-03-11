base:
  'os:windows':
    - match: grain
    - Windows.Defaults
  'os:Amazon':
    - match: grain
    - AWSLinux.Defaults
