# vim: ts=4 sts=4 sw=4 expandtab
node /^puppet\.vagrant\.local/ {
    include roles::puppet-master
}

node default {
    notify { "No specific catalog": message => "Blanck manifest!!!" }
}
