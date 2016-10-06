class ntp::client inherits ntp {
  file {'/etc/ntp.conf':
    content => 'ntp/ntp.conf',
    ensure => present,
    notify => Service['ntp'],
  }
}


