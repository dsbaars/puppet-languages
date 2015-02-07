# == Class: languages::nodejs
#
# Full description of class languages here.
#
# === Examples
#
#  class { 'languages::nodejs':
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
class languages::nodejs (
    $manage_repo = false
    ){

    include '::apt'

    ensure_packages('apt-transport-https')

    class { '::nodejs':
        manage_repo => $manage_repo
    }
}
