class puppet {
 class { '::puppet::install': } ->
 class { '::puppet::config': }  ->
 class { '::puppet::service':}  ->
 Class['puppet']
}
