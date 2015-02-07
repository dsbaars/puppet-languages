# == Class: languages::java
#
# Installs Oracle JDK 8
#
# === Examples
#
#  class { 'languages::java':
#       accept_license = true
#  }
#
# === Authors
#
# Djuri Baars <dsbaars@gmail.com>
#
# === Copyright
#
# Copyright 2015 Djuri Baars
#
class languages::java (
    $java_package = 'oracle-java8-installer',
    $java_set_default_package = 'oracle-java8-set-default',
    $accept_license = false
    ){
    include '::apt'

    if ($accept_license) {
        apt::ppa { 'ppa:webupd8team/java':

        }
        ->
        exec {
            'accept_license':
            command   => 'echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections',
            path      => '/usr/bin/:/bin/:/sbin/:/usr/sbin/',
            logoutput => true,
        }
        ->
        class { '::java':
            distribution => 'oracle-jdk',
            package      => $java_package,
        }
        ->
        package {
            $java_set_default_package: ensure => installed,
        }
    }
}
