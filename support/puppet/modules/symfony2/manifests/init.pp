class symfony2 (
        $host = "www.localhost.dev",        # Hostname to listen to
        $port = 80,                         # Actual port
        $phpmyadmin = true,                 # Do we need to install phpmyadmin or not
        $xdebug = true,                     # Do we need to install xdebug?

        $dbhost = "localhost",              # Database settings
        $dbname = "symfony2",
        $dbuser = "symfony2",
        $dbpass = "secret",
    ) {

    # Setup stuff
    class { "symfony2::setup" : }

    # Include our web server
    class { "symfony2::web" :
        host => '$host',
        port => $port,
    }

    # Include MySQL server
    class { "symfony2::mysql" : }

    # Initialize symfony2 project
    class { "symfony2::framework" : }

    # Create database
    class { "symfony2::create_db" :
        dbhost => $dbhost,
        dbname => $dbname,
        dbuser => $dbuser,
        dbpass => $dbpass,
    }

}
