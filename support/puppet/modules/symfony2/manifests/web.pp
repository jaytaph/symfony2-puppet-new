class symfony2::web($host, $port = 80, $phpmyadmin = false, $xdebug = false) {

    # Make sure we have run initial setup first!
    Class['symfony2::setup'] -> Class['symfony2::web']


    # Include the apache webserver
    include apache


    # Configure apache virtual host
    apache::vhost { $host :
        docroot   => "/vagrant/web",
        template  => "symfony2/vhost.conf.erb",
        port      => $port,
    }

    # Install PHP
    class { "symfony2::web::php" : }


    # Install xdebug if needed
    if $xdebug == true {
        class { "symfony2::web::xdebug" : }
    }


    # Do we need phpmyadmin?
    if $phpmyadmin == true {
        class { "symfony2::web::phpmyadmin" : }
    }


    # Change user / group
    exec { "UsergroupChange" :
        command => "sed -i 's/APACHE_RUN_USER=www-data/APACHE_RUN_USER=vagrant/ ; s/APACHE_RUN_GROUP=www-data/APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars",
        onlyif  => "grep -c 'APACHE_RUN_USER=www-data' /etc/apache2/envvars",
        require => Package["apache"],
        notify  => Service['apache'],
    }

    file { "/var/lock/apache2" :
        owner  => "vagrant",
        group  => "root",
        mode   => 0755,
        require => Package["apache"],
        notify  => Service['apache'],
    }

    exec { "disable_default_site" :
        command => "a2dissite default",
        require => Package["apache"],
        notify  => Service['apache'],
    }


#    file { "/var/lib/php/session" :
#        owner  => "root",
#        group  => "vagrant",
#        mode   => 0770,
#        require => Package["php"],
#    }
#
#
#    # Install PEAR
#    package { "php-pear" :
#        ensure => present,
#        require => Package['php'],
#    }

}
