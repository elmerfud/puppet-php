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
        "${php::params::conf_dir}curl.ini":
          owner   => root,
          group   => root,
          require => Class["php::install"],
          ensure  => file,
          source  => "puppet:///modules/php/modules_ini/curl.ini";
        "${php::params::conf_dir}fileinfo.ini":
          owner   => root,
          group   => root,
          require => Class["php::install"],
          ensure  => file,
          source  => "puppet:///modules/php/modules_ini/fileinfo.ini";
        "${php::params::conf_dir}json.ini":
          owner   => root,
          group   => root,
          require => Class["php::install"],
          ensure  => file,
          source  => "puppet:///modules/php/modules_ini/json.ini";
        "${php::params::conf_dir}phar.ini":
          owner   => root,
          group   => root,
          require => Class["php::install"],
          ensure  => file,
          source  => "puppet:///modules/php/modules_ini/phar.ini";
        "${php::params::conf_dir}zip.ini":
          owner   => root,
          group   => root,
          require => Class["php::install"],
          ensure  => file,
          source  => "puppet:///modules/php/modules_ini/zip.ini";
      }
    }
  }
}
