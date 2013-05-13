class symfony2::framework {

    # Composer install
    exec { "composer_install" :
        command => "/usr/bin/php /vagrant/bin/composer.phar install",
        cwd     => "/vagrant/",
        require => [ Class["symfony2::web::php"], Package["git"] ],
        timeout => 0,
        tries   => 10,
    }

    # Setup parameters.yml if it does not exist yet
    file { "parameters.yml" :
        path => "/vagrant/app/config/parameters.yml",
        source => '/vagrant/app/config/parameters.yml-dist',
        replace => "no",                                            # Don't update when file is present
        before  => Exec["composer_install"],
    }

}
