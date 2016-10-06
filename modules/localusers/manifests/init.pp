#default users
class users {

  $defaultpasswd = '$1$QH5X0av2$lr0aEA8.gYtGDfwmaJ1ID.'

  group { 'sysadmin':
    ensure  => 'present',
  }


  group { 'root':
    ensure  => 'present',
  }


  group { 'test1':
    ensure  => 'present',
  }

  group { 'test2':
    ensure => 'present',
  }

  group { 'test3':
    ensure  => 'present',
  }


  user { 'root':
    ensure           => 'present',
    comment          => 'root',
    gid              => '0',
    home             => '/root',
    password         => 'test',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    uid              => '0',
  }

   user { 'sysadmin':
     ensure        =>  'present',
     gid           =>  'sysadmin',
     groups        =>  ['wheel'],
     shell         =>  '/bin/sh',
     home          =>  '/opt/sysadmin',
     managehome    =>  'true',
     password      =>  'test',
   }

   user { 'test1':
     ensure        => 'present',
     gid           =>  'test1',
     groups        =>  ['wheel'],
     shell         =>  '/bin/sh',
     home          =>  '/home/test1',
     managehome    =>  'true',
     password      =>  $defaultpasswd,
   }

   user { 'test2':
     ensure        =>  'present',
     gid           =>  'test2',
     groups        =>  ['wheel'],
     shell         =>  '/bin/sh',
     home          =>  '/home/test2',
     managehome    =>  'true',
     password      =>  $defaultpasswd,
   }

   user { 'test3':
     ensure        =>  'present',
     gid           =>  'test3',
     groups        =>  ['wheel'],
     shell         =>  '/bin/sh',
     home          =>  '/home/test3',
     managehome    =>  'true',
     password      =>  $defaultpasswd,
   }
}
