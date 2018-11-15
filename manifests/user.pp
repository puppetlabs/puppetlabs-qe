class qe::user {

  group {
    'docker':
      gid => 654
      ;
    'jenkins':
      gid => 624
      ;
  }

  user { 'jenkins':
    ensure     => present,
    uid        => 22002,
    gid        => 624,
    home       => '/var/lib/jenkins',
    groups     => 'jenkins',
    managehome => true
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
