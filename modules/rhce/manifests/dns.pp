class rhce::dns {
  package { 'named':
    ensure=installed,
  }
  service { 'named':
    eneable=true,
  }
}
