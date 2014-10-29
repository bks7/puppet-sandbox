# vim: ts=4 sts=4 sw=4 expandtab
class puppet::service {
    service { 'puppetmaster':
        ensure      => running,
        enable      => 'true',
        hasrestart  => 'true',
        require     => [ Class['puppet::config'] ],
    }
}
