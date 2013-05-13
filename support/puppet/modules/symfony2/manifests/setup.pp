class symfony2::setup {

    # Install some default packages
    $default_packages = [ "mc", "strace", "sysstat", ]
    package { $default_packages :
        ensure => present,
    }

    package { "git-core" :
        name => "git",
        ensure => present,
    }

#    # Setup a EPEL repo, the default one is disabled.
#    file { "EpelRepo" :
#        path   => "/etc/yum.repos.d/epel.repo",
#        source => "puppet:///modules/symfony2/epel.repo",
#        owner  => "root",
#        group  => "root",
#        mode  => 0644,
#    }

}
