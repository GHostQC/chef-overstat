require 'spec_helper'

describe command('java -version | grep version') do
  its(:exit_status) { should eq 0 }
end

describe service('elasticsearch') do
  it { should be_enabled }
  it { should be_running }
end

describe user('elasticsearch') do
  it { should exist }
  it { should have_home_directory '/usr/share/elasticsearch' }
end

describe file('/usr/share/elasticsearch') do
  it { should be_directory }
end

describe file('/etc/elasticsearch/elasticsearch.yml') do
  it { should be_file }
  it { should contain('http.port: 9200') }
end

describe port('9200') do
  it { should be_listening }
end

describe command('sudo /usr/share/elasticsearch/bin/elasticsearch-plugin list') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should contain('x-pack') }
end

