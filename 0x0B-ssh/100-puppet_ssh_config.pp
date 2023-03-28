# setting up client config
include stdlib

file_line { 'Turn off Password Auth':
    ensure  => present,
    path    => '~/.ssh/config',
    line    => '    PasswordAuthentication no',
    replace => true,
}

file_line { 'Declare Identity File':
    ensure  => present,
    content => '~/.ssh/config',
    line    => '    IdentityFile ~/.ssh/school',
    replace => true,
}
