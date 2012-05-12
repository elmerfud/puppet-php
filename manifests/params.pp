class php::params {
    case $operatingsystem {
        /(Ubuntu|Debian)/: {
            $base_dir = "/etc/php5/"
            $cli_dir = "${base_dir}cli/"
            $cli_ini = "${cli_dir}php.ini"
            $cli_package_name = "php5-cli"
            $extra_dir = "${base_dir}extra/"
            $conf_dir = "${base_dir}conf.d/"
            $fpm_dir = "${base_dir}fpm/"
            $fpm_pool_dir = "${fpm_dir}pool.d/"
            $fpm_ini = "${fpm_dir}php.ini"
            $fpm_package_name = "php5-fpm"
            $fpm_conf = "${fpm_dir}php-fpm.conf"
            $fpm_service_name = "php5-fpm"
            $apache_dir = "${base_dir}apache2/"
            $apache_ini = "${apache_dir}php.ini"
            $apache_package_name = "libapache2-mod-php5"
            $apache_service_name = "apache2"
        }
        /(RedHat|CentOS)/: {
            #$base_dir = "/etc/php.d"
            #$cli_dir = "${base_dir}php.d/"
            #$cli_ini = "${base_dir}php.ini"

            $cli_package_name = "php-cli"

            #$extra_dir = "${base_dir}extra/"

            $php_ini = "/etc/php.ini"
            $conf_dir = "/etc/php.d/"

            #$fpm_dir = "${base_dir}php.d/"

            $fpm_conf_dir = "/etc/php-fpm.d/"

            #$fpm_ini = "${base_dir}php.ini"
            $fpm_package_name = "php-fpm"
            $fpm_conf = "/etc/php-fpm.conf"
            $fpm_service_name = "php-fpm"

            #$apache_dir = "${base_dir}php.d/"
            #$apache_ini = "${base_dir}php.ini"

            $apache_package_name = "libapache2-mod-php5"
            $apache_service_name = "apache2"
        }

    }
}
