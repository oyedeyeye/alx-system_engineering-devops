# automate the task of creating a custom HTTP header response
# The name of the custom HTTP header must be X-Served-By
# Value of the custom HTTP header must be hostname of server Nginx is on

exec { 'apt-get update':
    command  => '/usr/bin/apt-get update -y',
}

package { 'nginx':
    ensure   => 'installed',
    provider => 'apt',
    require  => Exec['apt-get update'],
}

file_line { 'custom_http_header':
    path     => '/etc/nginx/sites-available/default',
    before   => 'root /var/www/html;',
    line     => 'add_header X-Served-By "$hostname";',
    notify   => Service['nginx running'],
    require  => Package['nginx'],
}

service { 'nginx running':
    ensure   => 'running',
    require  => Package['nginx'],
}
