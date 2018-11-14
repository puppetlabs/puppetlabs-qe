class qe {

  include git
  include stdlib
  include qe::packages

  group {
    'docker':
      gid => 654
      ;
    'jenkins':
      gid => 624
      ;
  }

  user { 'jenkins':
    ensure => present,
    uid    => 22002,
    gid    => 624,
    home   => '/var/lib/jenkins',
    groups => 'jenkins'
  }

  file_line { 'default_locale':
    ensure  => present,
    path    => '/etc/locale.gen',
    line    => 'en_US.UTF-8 UTF-8',
    match   => '# en_US.UTF-8 UTF-8',
    require => Package['locales']
  }

  exec { '/usr/sbin/locale-gen en_US.UTF-8':
    require => File_line['default_locale']
  }

  git::config {
    default:
      user    => 'jenkins',
      require => Package['git']
      ;
    'user.name':
      value => 'Jenkins CI'
      ;
    'user.email':
      value => 'ci@puppet.com'
      ;
  }

}
