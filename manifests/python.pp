# == Class: languages::python
#
# Full description of class languages here.
#
# === Examples
#
#  class { 'languages::python':
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
class languages::python (
    $manage_repo = false
    ){

    class { '::python' :
        version    => 'system',
        pip        => true,
        dev        => true,
        virtualenv => true,
        gunicorn   => false,
    }

    $pkgs = ['libxml2-dev', 'libxslt1-dev']

    ensure_packages($pkgs)
}
