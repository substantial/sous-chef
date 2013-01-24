#!/usr/bin/env rake

require 'rubygems'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

require 'sous-chef'

desc 'Default: run unit tests.'
task :default => :spec

desc "Run all specs"
RSpec::Core::RakeTask.new do |t|
 t.pattern = 'spec/**/*_spec.rb'
 end
