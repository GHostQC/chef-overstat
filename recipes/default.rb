#
# Cookbook Name:: overstat_elk
# Recipe:: default
#
# Copyright (C) 2016 Automotive Data Solutions
#
# All rights reserved - Do Not Redistribute
#
node.override['java']['install_flavor'] = 'oracle'
node.override['java']['jdk_version'] = '8'
node.override['java']['oracle']['accept_oracle_download_terms'] = true
include_recipe 'java::default'

include_recipe 'elasticsearch::default'
include_recipe 'logstash::default'

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
