# == Class: languages::php
#
# Full description of class languages here.
#
# === Examples
#
#  class { 'languages::php':
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
class languages::php (
    $manage_repo = false
    ) {
    include 'php'
    include 'apt'

    if ($manage_repo) {
        apt::ppa { 'ppa:ondrej/php5':

        }
    }

    # Ensure base packages is installed in the correct order
    # and before any php extensions
    Package['php5-common']
        -> Package['php5-dev']
        -> Package['php5-cli']
        -> Php::Extension <| |>

    class { 'php::dev':
    }
    ->
    class { [
            '::php::fpm',
            '::php::cli',
        ]:
        ensure   => latest,
        settings => [
            "set 'PHP/date.timezone' 'Europe/Amsterdam'"
        ],
        require  => [
            Exec['apt_update']
        ]
    }
    ->
    class { [
        '::php::extension::apcu',
        '::php::extension::intl',
        # 'php::extension::opcache',
        '::php::extension::curl',
        '::php::extension::mcrypt',
        '::php::extension::imagick',
        '::php::extension::mysql',
        '::php::extension::pgsql',
        '::php::composer'
        ]:
    }

    # Don't want this.
    package {
        'php5-xdebug': ensure => absent,
    }
}
