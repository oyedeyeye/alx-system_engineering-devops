# automate the task of creating a custom HTTP header response
# The name of the custom HTTP header must be X-Served-By
# Value of the custom HTTP header must be hostname of server Nginx is on

exec { 'command':
    command  => 'apt-get update -y;
    apt-get install nginx -y;
    sudo sed -i "/listen [::]:80 default_server;/a add_header X-Served-By $hostname" /etc/nginx/sites-available/default;
    service nginx restart',
    user     => 'root',
    provider => 'shell',
}

