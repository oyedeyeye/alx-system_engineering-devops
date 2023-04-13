# automate the task of creating a custom HTTP header response
# The name of the custom HTTP header must be X-Served-By
# Value of the custom HTTP header must be hostname of server Nginx is on

exec { 'server update':
    command  => 'apt-get update',
    user     => 'root',
    provider => 'shell',
}

package { 'nginx':
    ensure   => 'installed',
    provider => 'apt',
    require  => Exec['server update'],
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
