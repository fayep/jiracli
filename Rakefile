#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'rspec'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new("spec") do |t|
  t.pattern = "spec/**/*_spec.rb"
end

#task :default => :build
task :default => :spec
