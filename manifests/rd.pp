class mystuff::rd(
  String $version,
) {
  class { 'java':
    distribution => 'jre',
  }

  class { '::rundeck':
    package_ensure => $version,
    require        => Class['java'],
  }
}
