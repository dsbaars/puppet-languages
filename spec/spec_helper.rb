require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
    c.default_facts = {
        :osfamily               => 'Debian',
        :operatingsystem        => 'Ubuntu',
        :operatingsystemrelease => '14.04',
        :architecture           => 'amd64',
        :lsbdistid              => 'Ubuntu',
        :lsbdistcodename        => 'trusty',
        :concat_basedir         => '/foo',
    }
end
