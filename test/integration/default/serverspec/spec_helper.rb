require 'serverspec'

set :backend, :exec

set :path, '/sbin:/usr/local/sbin:/usr/share/elasticsearch:$PATH'
