require 'rake'
require 'rspec/core/rake_task'
require 'rubygems'
require 'yaml'
require 'highline/import'

if not ENV["HOSTS_FILE"]
  raise 'Provide YAML file containing host details using env variable HOSTS_FILE'
end

if not ENV["RESULT_PATH"]
  raise 'Provide output location to store result  using env variable RESULT_PATH'
end

properties = YAML.load_file(ENV["HOSTS_FILE"])
output_path = ENV["RESULT_PATH"]

desc "Run serverspec test on all provided hosts"
task :spec => 'serverspec:all'
status = 0

namespace :serverspec do
  task :all do

    hosts = properties.keys

    properties.keys.each do |key|
      roles = properties[key][:roles]
      desc "Running serverspec test on #{key} for roles #{roles}"
      roles.each do |role|
        puts "Running role #{role} on host #{key}"
        RSpec::Core::RakeTask.new("#{role}-#{key}") do |t|
          ENV['TARGET_HOST'] = key
          t.pattern = 'spec/{' + role + '}/*_spec.rb'
	  t.rspec_opts = "--format documentation --format html --out #{output_path}/#{key}-ss.html --format documentation --format json --out #{output_path}/#{key}-ss.json"
        end
        begin
          Rake::Task["#{role}-#{key}"].execute
          puts "Serverspec test on host #{key} SUCCESS for role #{role}"
        rescue Exception => e
          puts "Serverspec test on host #{key} FAILED for role #{role} with error #{e}"
          status = status + 1
        end
      end
    end
    exit status
  end
end

