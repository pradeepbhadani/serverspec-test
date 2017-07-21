require 'spec_helper'

describe package('tar') do
  it { should be_installed }
end

describe package('telnet') do
  it { should be_installed }
end

describe package('rsync') do
  it { should be_installed }
end

describe package('git') do
  it { should be_installed }
end


describe package('openssh-server') do
  it { should be_installed }
end

describe package('wget') do
  it { should be_installed }
end

describe package('curl') do
  it { should be_installed }
end
