class qe::packages {

  apt::source { 'jessie_backports':
    location => 'http://deb.debian.org/debian',
    release  => 'jessie-backports'
  }

  package {
    'ca-certificates-java':
      ensure => '20161107~bpo8+1',
      require => [Apt::Source['jessie_backports']]
      ;
    [
      'apt-transport-https',
      'apt',
      'bzr',
      'openssh-client',
      'ca-certificates',
      'curl',
      'debian-goodies',
      'gnupg2',
      'keychain',
      'less',
      'lsb-release',
      'locales',
      'openjdk-8-jdk',
      'openjdk-8-jre-headless',
      'software-properties-common',
      'sudo',
      'netbase',
      'wget'
    ]:
      ensure  => latest,
      require => [
        Apt::Source['jessie_backports'],
        Package['ca-certificates-java']
      ]
      ;
    'openjdk-7-jre-headless:amd64':
      ensure => absent
      ;
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

}
