name             'rsc_memcached'
maintainer       'RightScale, Inc.'
maintainer_email 'cookbooks@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures memcached server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

depends 'yum'
depends 'apt'
depends 'marker', '~> 1.0.1'
depends 'application' ,'~> 4.1.4'
depends 'collectd', '~> 1.1.0'
depends 'machine_tag', '~> 1.0.8'
depends 'memcached', '~> 1.7.2'


recipe 'rsc_memcached::default', 'Installs/configures a memcached server'
recipe 'rsc_memcached::tags', 'Sets up tags for finding the memcached server'
recipe 'rsc_memcached::collectd', 'Sets up collectd monitoring for the memcached server'



attribute 'rsc_memcached/bind_network_interface',
  :display_name => 'Memcached Bind Network Interface',
  :description => "The network interface to use for the bind address of the memcached server." +
  " It can be either 'private' or 'public' interface.",
  :default => 'private',
  :choice => ['public', 'private'],
  :required => 'optional',
  :recipes => ['rsc_memcached::tags']

attribute 'memcached/memory',
  :display_name => 'Memcached Memory',
  :description => 'maximum memory for memcached instances, defaults to 1024, 1g',
  :default => '1024',
  :required => 'optional',
  :recipes => ['rsc_memcached::default']

attribute 'memcached/port',
  :display_name => 'Memcached Listen Port',
  :description => 'TCP port for memcached to listen on, defaults to 11211',
  :required => 'required',
  :recipes => ['rsc_memcached::default']

attribute 'memcached/udp_port',
  :display_name => 'Memcached udp_port',
  :description => 'UDP port for memcached to listen on, defaults to 11211',
  :required => 'required',
  :recipes => ['rsc_memcached::default']

attribute 'memcached/user',
  :display_name => 'Memcached User',
  :description => 'user to run memcached as,  defaults to memcached',
  :default => 'memcached',
  :required => 'optional',
  :recipes => ['rsc_memcached::default']

attribute 'memcached/maxconn',
  :display_name => 'Memcached Max connections',
  :description => 'maximum number of connections to accept, defaults to 1024',
  :default => '1024',
  :required => 'optional',
  :recipes => ['rsc_memcached::default']

attribute 'memcached/max_object_size',
  :display_name => 'Memcached Max Object Size',
  :description => 'maximum size of an object to cache, defaults to 1MB',
  :default => '1m',
  :required => 'optional',
  :recipes => ['rsc_memcached::default']
