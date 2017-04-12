name             'overstat_elk'
maintainer       'Jessy St-Pierre'
maintainer_email 'ghost.serverhost@gmail.com'
license          'All rights reserved'
description      'Installs/Configures overstat_elk'
long_description 'Installs/Configures overstat_elk'
version          '0.2.0'

depends 'yum-epel'
depends 'java'
depends 'elasticsearch'
depends 'logstash'

%w(centos redhat).each do |os|
  supports os
end

%w(poise-python cron yum-epel yum java elasticsearch kibana5 logstash).each do |ckbk|
  depends ckbk
end

# For compatibility with 12.X versions of Chef
depends 'compat_resource'

chef_version '>= 12.1' if respond_to?(:chef_version)
source_url 'https://github.com/GHostQC/chef-overstat' if respond_to?(:source_url)
issues_url 'https://github.com/GHostQC/chef-overstat/issues' if respond_to?(:issues_url)
