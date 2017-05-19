#
# Cookbook Name:: overstat_elk
# Recipe:: default
#
# Copyright (C) 2016 Automotive Data Solutions
#
# All rights reserved - Do Not Redistribute
#

# Setup Oracle JDK 8
node.override['java']['install_flavor'] = 'oracle'
node.override['java']['jdk_version'] = '8'
node.override['java']['oracle']['accept_oracle_download_terms'] = true
include_recipe 'java::default'

include_recipe 'runit::default'

node.override['firewall']['allow_ssh'] = 'true'
include_recipe 'firewall::default'

include_recipe 'elasticsearch::default'
include_recipe 'logstash'

# Elasticsearch

elasticsearch_user 'elasticsearch'

user 'elasticsearch' do
  home '/usr/share/elasticsearch'
  action :manage
end

elasticsearch_configure 'elasticsearch' do
  configuration(
    'http.port' => 9200
  )
end

elasticsearch_service 'elasticsearch' do
  action %i[enable start]
end

elasticsearch_plugin 'x-pack'

# Logstash


logstash_instance 'default' do
  checksum '7f62a03ddc3972e33c343e982ada1796b18284f43ed9c0089a2efee78b239583'
  version '2.3.4'
  source_url 'https://download.elastic.co/logstash/logstash/logstash-2.3.4.tar.gz'
end

logstash_plugins 'logstash-input-http_poller'

logstash_config 'overstat' do
  instance 'default'
  templates 'overstat-input-output' => 'overstat-config.erb'
  templates_cookbook 'overstat_elk'  
end

logstash_service 'default' do
  templates_cookbook 'overstat_elk'
end
