# vim: ts=4 sts=4 sw=4 expandtab
class profiles::puppet-server {
    include puppet

    package { 'r10k':
        provider => 'gem',
        require => Class['puppet']
    }

    file { '/etc/r10k.yaml':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        source  => 'puppet:///modules/profiles/r10k.yaml',
        require => Package['r10k'],
    }
}