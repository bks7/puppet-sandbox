# vim: ts=4 sts=4 sw=4 expandtab
class puppet::install {

    include puppet::params

    package { 'puppet-server':
        ensure => $::puppet::params::puppet_package_version,
    }

}
