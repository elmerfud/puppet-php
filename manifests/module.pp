define php::module(
  $ensure = present,
  $package_prefix = 'php5-',
  $source = undef,
  $content = undef,
  $notify = undef
) {
  include php

  $file_name = "${name}.ini"

    $real_require = Class['php::install']

  package { "php-${name}":
    ensure  => $ensure,
    name    => "${package_prefix}${name}",
    require => $real_require,
  }

  file { 
    "${php::params::conf_dir}$file_name":
      path    => "${php::params::conf_dir}${file_name}",
      mode    => '644',
      owner   => root,
      group   => root,
      ensure  => $ensure,
      notify  => $notify,
      source  => $source ? {
            undef   => undef,
            true    => [
                "puppet:///modules/php/modules_ini/${file_name}",
                "puppet:///files/${fqdn}/etc/php5/conf.d/${file_name}",
                "puppet:///files/${hostgroup}/etc/php5/conf.d/${file_name}",
                "puppet:///files/${domain}/etc/php5/conf.d/${file_name}",
                "puppet:///files/global/etc/php5/conf.d/${file_name}",
            ], 
            default => "${source}${file_name}",
      },
      content => is_array($content) ? {
            true    => inline_template("<%= (@content).join('\n') + '\n' %>"),
            false => $content ? { 
                undef => undef,
                default => template("${content}${file_name}.erb"),
            },
      },
      require => [ Class["php"], Package["php-${name}"] ];
    }
}
