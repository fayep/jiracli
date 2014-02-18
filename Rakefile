#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'rspec'
require 'rspec/core/rake_task'
require 'fileutils'

RSpec::Core::RakeTask.new("spec") do |t|
  t.pattern = "spec/**/*_spec.rb"
end

task :check_config do
  desc "Check if the config file exists"
  cfg=File.expand_path("../config/jira.yml",__FILE__)
  template=File.expand_path("../config/jira.yml.sample",__FILE__)
  begin
    unless File.file?(cfg)
      if File.file?(template)
        FileUtils::cp(template, cfg)
      end
      raise "Please edit config/jira.yml"
    end
  end
end

task :build => [:check_config]

task :default => :spec


