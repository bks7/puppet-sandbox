# vim: ts=4 sts=4 sw=4 expandtab
class puppet::config::server {

    file { '/etc/puppet/puppet.conf':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        source  => 'puppet:///modules/puppet/puppet.conf',
        require => Class['puppet::install'],
        notify  => Service['puppetmaster'],
    }


    file { '/etc/puppet/autosign.conf':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        content => template('puppet/autosign.conf.erb'),
        require => Class['puppet::install'],
    }

}
