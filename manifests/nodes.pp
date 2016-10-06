#default node which is used to apply to every puppet client that is mangaed by puppet
#node 'default' {
#  include nginx
#}

#Below is example per host 
#node 'nginx' {
#  include nginx
#  package { 'tree':
#    ensure => latest
#  }
#}

#here we will use definitions for a node
#node 'nginx' {
#  nginx::vhostsite { 'kernel-linux':
#    site_domain => 'kernel-linux.com',
#  }
#}

#example of using a class per node in this case the ntp class with passing a parameter
#defined in init.pp of ntp module.
#node 'nginx' {
#  class { 'ntp':
#    server => '0.us.pool.ntp.org',
#  }
#}
#we use our definition to specify we want to use the client module of the ntp class client.pp
node 'nginx' {
  include ntp::client
}

