file { "~/.ssh/config":
    ensure   => file,
    content => "Host 35.153.50.50\n IdentityFile ~/.ssh/school\n PasswordAuthentication no\n"
    owner   => "ubuntu",
    group   => "ubuntu",
    mode    => "0600",
}