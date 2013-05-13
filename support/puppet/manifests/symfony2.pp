# Set default path for Exec calls
Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}

exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>

node default {

    #
    # Either add:
    #    class { "symfony2" :
    #               "host" => ...
    #               ...
    #          }
    #
    # Or install the components separately, if you wish to
    # fine-tune what to install on a node.
    #

    class { "symfony2::setup" : }

    # Include our web server
    class { "symfony2::web" :
        host => 'www.symfony2-project.dev',
        port => 80,
    }

    # Include MySQL server
    class { "symfony2::mysql" :
    }

    # Initialize symfony2 framework
    class { "symfony2::framework" :
    }

    # Create database
    class { "symfony2::create_db" :
        dbname => 'symfony2',
        dbuser => 'symfony2',
        dbpass => 'secret',
    }

}
