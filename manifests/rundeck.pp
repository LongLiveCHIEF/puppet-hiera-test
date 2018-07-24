class puppet_hiera_test::rundeck(
  String $version = present,
) {
  class { 'java':
    distribution => 'jre',
  }

  class { '::rundeck':
    package_ensure => $version,
    require        => Class['java'],
  }
}
