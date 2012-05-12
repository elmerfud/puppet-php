class php::config {
  case $operatingsystem {
    /(Ubuntu|Debian)/: {
      file { 
        $php::params::extra_dir:
          owner   => root,
          group   => root,
          purge   => true,
          recurse => true,
          force   => true,
          require => Class["php::install"],
          ensure  => directory;
        $php::params::conf_dir:
          owner   => root,
          group   => root,
          purge   => true,
          recurse => true,
          force   => true,
          require => Class["php::install"],
          ensure  => directory;
        $php::params::cli_ini:
          owner   => root,
          group   => root,
          require => Class["php::install"],
          ensure  => file,
          content => $php::php_ini_content,
          source  => $php::php_ini_source;
        $php::params::cli_dir:
          owner   => root,
          group   => root,
          purge   => true,
          recurse => true,
          force   => true,
          require => Class["php::install"],
          ensure  => directory;
        "${php::params::cli_dir}conf.d":
          ensure => "../conf.d";
      }

    }
    /(RedHat|CentOS)/: {
      file {
        $php::params::conf_dir:
          owner   => root,
          group   => root,
          purge   => true,
          recurse => true,
          force   => true,
          require => Class["php::install"],
          ensure  => directory;
        $php::params::php_ini:
          owner   => root,
          group   => root,
          require => Class["php::install"],
          ensure  => file,
          content => $php::php_ini_content,
          source  => $php::php_ini_source;

    }
  }
}
