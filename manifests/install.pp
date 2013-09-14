class php::install {

  package { $php::params::cli_package_name:
    ensure => present,
    require => $php::require;
  }
}
