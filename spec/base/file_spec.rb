require 'spec_helper'

describe file('/etc/passwd') do
  it { should be_file }
end

describe file('/etc/sudoers') do
  it { should be_owned_by 'root' }
end


