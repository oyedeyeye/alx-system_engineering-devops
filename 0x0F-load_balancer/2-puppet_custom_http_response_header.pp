# automate the task of creating a custom HTTP header response
# The name of the custom HTTP header must be X-Served-By
# Value of the custom HTTP header must be hostname of server Nginx is on

redirect_config="\\\n\n\trewrite ^/(.*)/$ /\$1 permanent;\n\n\tlocation = /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\n\t}\n"

error_config="\\\n\n\terror_page 404 /404.html;\n\n\tlocation = /404.html {\n\t\tinternal;\n\t}\n"

exec { 'command':
    command  => 'apt-get update -y;
    apt-get install nginx -y;
    sudo ufw allow 'Nginx HTTP';
    mkdir -p /var/www/html/;
    echo 'Hello World!' | sudo tee /var/www/html/index.html > /dev/null;
    echo "Ceci n'est pas une page" | sudo tee /var/www/html/404.html > /dev/null;
    sudo sed -i "53i $redirect_config" /etc/nginx/sites-available/default;
    sudo sed -i "53i $error_config" /etc/nginx/sites-available/default;
    sudo sed -i "/listen [::]:80 default_server;/a add_header X-Served-By $hostname" /etc/nginx/sites-available/default;
    service nginx restart;',
    provider => 'shell',
}
