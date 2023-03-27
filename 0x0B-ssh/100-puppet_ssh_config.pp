# setting up client config
include stdlib

file_line { "Turn off Password Auth":
    ensure  => present,
    path    => "etc/ssh/ssh_config",
    line    => "    PasswordAuthentication no",
    replace => true,
}

file_line { "Declare Identity File":
    ensure  => present,
    content => "etc/ssh/ssh_config",
    line    => "    IdentityFile ~/.ssh/school",
    replace => true,
}
