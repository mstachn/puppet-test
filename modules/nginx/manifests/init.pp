#basic class
class nginx {

  file { '/etc/updatestat':
    content => inline_template("File Generated by Puppet\n Host: <%= @fqdn %>\n"),
    ensure => present,
    path => '/etc/updatestat',
    group => 'root',
    owner => 'root',
    mode => '0740',
  }
  
  exec { 'sys-update':
    command => '/usr/bin/apt-get update',
    refreshonly => true,
    subscribe => File['/etc/updatestat'],
  }
  
  package { 'apache2.2-common':
    ensure => absent,
  }

  package { 'nginx':
    ensure => installed,
    require => [
      Exec['sys-update'],
      Package['apache2.2-common'],
    ],
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx'],
  }

  file { ['/var/www', '/var/www/html']:
    ensure => directory,
    owner => 'www-data',
    group => 'www-data',
    mode => '0750',
    require => Package['nginx'],
  }

  file { '/var/www/html/index.html':
    source => 'puppet:///modules/nginx/index.html',
    owner => 'www-data',
    group => 'www-data',
    mode =>  '770',
    require => Package['nginx'],
  }

  file { '/etc/nginx/nginx.conf':
    source => 'puppet:///modules/nginx/nginx.conf',
    notify => Service['nginx'],
    require => Package['nginx'],
  }

  file { '/etc/nginx/vhost.d':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '750',
    require => Package['nginx'],
  }

  file { '/etc/nginx/vhost.d/default.conf':
    source => 'puppet:///modules/nginx/default.conf',
    owner => 'root',
    group => 'root',
    notify => Service['nginx'],
    require => [
      Package['nginx'],
      File['/etc/nginx/vhost.d'],
    ],
  }
}
