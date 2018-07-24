class mystuff::rd(
  String $version,
) {
  package {'somepackage':
    ensure => $version
  }
}
