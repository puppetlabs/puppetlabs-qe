class qe {

  group { 'docker':
    ensure => present,
    gid    => 654
  }

  user { 'jenkins':
    ensure => present,
    uid    => 22002,
    gid    => 624,
    home   => '/var/lib/jenkins',
    group  => 'jenkins'
  }

  file_line { 'default_locale':
    ensure => present,
    path   => '/etc/locale.gen',
    line   => 'en_US.UTF-8 UTF-8',
    match  => '# en_US.UTF-8 UTF-8'
  }

  exec { '/usr/sbin/locale-gen en_US.UTF-8': }

  include git

  git::config {
    default:
      user => 'jenkins'
      ;
    'user.name':
      value => 'Jenkins CI'
      ;
    'user.email':
      value => 'ci@puppet.com'
      ;
  }

}
