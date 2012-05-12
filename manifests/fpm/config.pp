class php::fpm::config {
  case $operatingsystem {
    /(Ubuntu|Debian)/: {
      file { 
        $php::params::fpm_dir:
          owner   => root,
          group   => root,
          purge   => true,
          recurse => true,
          force   => true,
          require => Class["php::fpm::install"],
          notify  => Class["php::fpm::service"],
          ensure  => directory;
        "${php::params::fpm_dir}conf.d":
          ensure  => "../conf.d",
          require => File[$php::params::fpm_dir],
          notify  => Class["php::fpm::service"];
        "${php::params::fpm_dir}pool.d":
          owner   => root,
          group   => root,
          purge   => true,
          recurse => true,
          force   => true,
          require => Class["php::fpm::install"],
          notify  => Class["php::fpm::service"],
          ensure  => directory;
        $php::params::fpm_ini:
          owner   => root,
          group   => root,
          require => Class["php::fpm::install"],
          notify  => Class["php::fpm::service"],
          content => $php::fpm::fpm_ini_content,
          source  => $php::fpm::fpm_ini_source,
          ensure  => file;
        $php::params::fpm_conf:
          owner   => root,
          group   => root,
          require => Class["php::fpm::install"],
          notify  => Class["php::fpm::service"],
          ensure  => file,
          content => $php::fpm::fpm_conf_content,
          source  => $php::fpm::fpm_conf_source,
      }
    }
    /(RedHat|CentOS)/: {
      file {
        "${php::params::fpm_conf_dir}":
          owner   => root,
          group   => root,
          purge   => true,
          recurse => true,
          force   => true,
          require => Class["php::fpm::install"],
          notify  => Class["php::fpm::service"],
          ensure  => directory;
        $php::params::fpm_conf:
          owner   => root,
          group   => root,
          require => Class["php::fpm::install"],
          notify  => Class["php::fpm::service"],
          ensure  => file,
          content => $php::fpm::fpm_conf_content,
          source  => $php::fpm::fpm_conf_source;
      }    
    }
  }
}
