# setting up client config
include stdlib

file_line { 'Set SSH client configuration':
  path => '/etc/ssh/ssh_config',
  line => [
    'IdentityFile ~/.ssh/school',
    'PasswordAuthentication no',
  ],
  match => '^#*IdentityFile.*$',
}
