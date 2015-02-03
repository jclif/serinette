require 'rspec'
require 'rspec/core/rake_task'
require './dependencies.rb'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.fail_on_error = false
  t.rspec_opts = ["--format documentation", "--color", "--order=default"]
  t.pattern = ARGV[1] || "spec/*_spec.rb"
end

RSpec::Core::RakeTask.new(:travis_spec) do |t|
  t.fail_on_error = false
  t.rspec_opts = ["--color", "--order=default"]
  t.pattern = ARGV[1] || "spec/*_spec.rb"
end

task :default => :spec
