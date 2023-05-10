# fix 500 error on Apache running broken wordpress website
exec { 'fix-Apache-server':
    command => 'bash -c "sed -i s/class-wp-locale.phpp/class-wp-locale.php/ \
    /var/www/html/wp-settings.php; service apache2 restart"',
    path    => '/usr/bin:/usr/sbin/:/bin'
}