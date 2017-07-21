require 'serverspec'
require 'net/ssh'
require 'yaml'

set :backend, :ssh
set :request_pty, true

host = ENV['TARGET_HOST']

options = Net::SSH::Config.for(host)

properties = YAML.load_file(ENV["HOSTS_FILE"])
hosts = properties.keys

if ENV["SSH_USER"]
  options[:user] = ENV["SSH_USER"]
else
  raise 'Provide YAML file containing host details using env variable HOSTS_FILE'
end

if ENV['SSH_KEY']
  options[:keys] = [ENV['SSH_KEY']]
elsif ENV['ASK_SSH_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available.Install this package."
  end
  options[:password] = ask("Enter password: ") { |q| q.echo = false }
  options[:auth_methods] =  %w(password)
elsif ENV['SSH_PASSWORD']
  options[:password] = ENV['SSH_PASSWORD']
  options[:auth_methods] =  %w(password)
else
   raise 'No user password provided.'
end

#Custom SSH Port
if ENV["SSH_PORT"]
  options[:port] = ENV["SSH_PORT"]
end

set :host, options[:host_name] || host
set :ssh_options, options


