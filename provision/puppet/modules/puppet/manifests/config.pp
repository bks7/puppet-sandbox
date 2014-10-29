# vim: ts=4 sts=4 sw=4 expandtab
class puppet::config ($puppet_role = 'server') {

    case $puppet_role {
        'server': { include puppet::config::server}
#        'client': { include puppet::config::client }
    }

}
