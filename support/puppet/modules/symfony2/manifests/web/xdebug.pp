class symfony2::web::xdebug {

    php::module { "pecl-xdebug" :
        # xdebug is in the epel repo
        require => File["EpelRepo"],
    }

    augeas { 'set-xdebug-ini-values':
        context => '/files/etc/php.d/xdebug.ini',
        changes => [
            'set Xdebug/xdebug.remote_enable On',
            'set Xdebug/xdebug.remote_connect_back On',
            'set Xdebug/xdebug.remote_port 9000',
            'set Xdebug/xdebug.remote_handler dbgp',
            'set Xdebug/xdebug.remote_autostart On',
            'set Xdebug/xdebug.remote_log /vagrant/xdebug.log',
        ],
        require => Php::module["pecl-xdebug"],
        notify  => Service['apache'],
    }

}
