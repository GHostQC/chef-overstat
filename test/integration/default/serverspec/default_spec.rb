require 'spec_helper'

# 0- check dependencies
describe command('java -version') do
  its(:exit_status) { should eq 0 }
end

# 1- Elasticsearch checks
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

# 2- Logstash checks

describe user('logstash') do
  it { should exist }
end

describe file('/opt/logstash/default') do
  it { should be_directory }
end

describe file('/opt/logstash/default/etc/conf.d/overstat-input-output') do
  it { should be_file }
end

