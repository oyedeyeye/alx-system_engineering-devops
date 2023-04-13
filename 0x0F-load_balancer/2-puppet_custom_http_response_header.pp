# automate the task of creating a custom HTTP header response
# The name of the custom HTTP header must be X-Served-By
# Value of the custom HTTP header must be hostname of server Nginx is on

exec { 'server update':
    command  => 'apt-get update',
    user     => 'root',
    provider => 'shell',
}
->
package { 'nginx':
    ensure   => present,
    provider => 'apt',
}
->
file_line { 'custom_http_header':
    ensure   => 'present',
    path     => '/etc/nginx/sites-available/default',
    after    => 'listen [::]:80 default_server;',
    line     => 'add_header X-Served-By $hostname;',
}
->
service { 'nginx running':
    ensure   => 'running',
    require  => Package['nginx'],
}
