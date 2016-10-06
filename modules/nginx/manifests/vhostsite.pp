#Manages NGINX vhosts.
define nginx::vhostsite( $site_domain ) {
  include nginx
  $site_name = $name
 # file { "/var/www/${site_name}
  file { "/etc/nginx/vhost.d/${site_name}.conf":
    content => template('nginx/vhost.conf.erb'),
    notify => Services['nginx'],
  }
}

