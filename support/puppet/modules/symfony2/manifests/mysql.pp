class symfony2::mysql {

    Class['symfony2::setup'] -> Class['Symfony2::mysql']

    class { "::mysql" : }
}
