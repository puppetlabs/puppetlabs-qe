class qe::packages {

  apt::source { 'jessie_backports':
    location => 'http://deb.debian.org/debian',
    release  => 'jessie-backports'
  }

  package {
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
      'ca-certificates-java',
      'openjdk-8-jre-headless',
      'openjdk-8-jdk',
      'less',
      'lsb-release',
      'locales',
      'software-properties-common',
      'sudo',
      'netabse',
      'wget'
    ]:
      ensure  => latest,
      require => Apt::Source['jessie_backports']
  }

}
