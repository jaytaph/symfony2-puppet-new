class symfony2::web::php {

    package { [ "libapache2-mod-php5", "php5-cli" ] :
        ensure => installed,
    }

    # Install PHP modules
    #php::module { "mysql" : }
    #php::module { "xml" : }
    #php::module { "pecl-apc" : }
    package { "php-apc" : }
    package { "php5-mysql" : }

#    # Set development values to our php.ini and xdebug.ini
#    augeas { 'set-php-ini-values':
#        context => '/files/etc/php.ini',
#        changes => [
#            'set PHP/error_reporting "E_ALL | E_STRICT"',
#            'set PHP/display_errors On',
#            'set PHP/display_startup_errors On',
#            'set PHP/html_errors On',
#            'set Date/date.timezone Europe/Amsterdam',
#        ],
#        require => Package['libapache2-mod-php5'],
#        notify  => Service['apache'],
#    }

}
