class php(
  $php_ini_content = undef, 
  $php_ini_source = undef, 
  $php_package_prefix = 'php-',
  $require = undef) {
    class {
      'php::params':
        php_package_prefix => $php_package_prefix;
    }
    
    include php::install, php::config, php::params
}
