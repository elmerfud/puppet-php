class php(
  $php_ini_content = undef, 
  $php_ini_source = undef, 
  $php_package_prefix = 'php-') {
    class {
      'php::params':
        php_package_prefix => $php_package_prefix;
    }
    
    include php::install, php::config
}
