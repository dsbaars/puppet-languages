require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

desc "Validate manifests, templates, and ruby files"
task :validate do
    Dir['manifests/**/*.pp'].each do |manifest|
        sh "puppet parser validate --noop #{manifest}"
    end
    Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
        sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
    end
    Dir['templates/**/*.erb'].each do |template|
        sh "erb -P -x -T '-' #{template} | ruby -c"
    end
end

task :metadata do
  sh "metadata-json-lint metadata.json --no-strict-license"
end

Rake::Task[:lint].clear
PuppetLint::RakeTask.new :lint do |config|
    config.pattern = 'manifests/**/*.pp'

    config.disable_checks = [
        '80chars',
        'class_parameter_defaults',
        'class_inherits_from_params_class',
        'autoloader_layout'
    ]
    config.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
    config.fail_on_warnings = true
    #config.relative = true

    config.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp", "modules/**/*", "vagrant/**"]
end
