#
# Cookbook Name:: rsc_memcached
# Recipe:: collectd
#
# Copyright (C) 2014 RightScale, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

marker 'recipe_start_rightscale' do
  template 'rightscale_audit_entry.erb'
end

# Setup memcached collectd plugin
if node['rightscale'] && node['rightscale']['instance_uuid']
  Chef::Log.info "Overriding collectd/fqdn to '#{node['rightscale']['instance_uuid']}'..."
  node.override['collectd']['fqdn'] = node['rightscale']['instance_uuid']
end

chef_gem 'chef-rewind'
require 'chef/rewind'

log 'Installing memcached collectd plugin...'

include_recipe 'collectd::default'

# collectd::default recipe attempts to delete collectd plugins that were not
# created during the same runlist as this recipe. Some common plugins are installed
# as a part of base install which runs in a different runlist. This resource
# will safeguard the base plugins from being removed.
rewind 'ruby_block[delete_old_plugins]' do
  action :nothing
end

log "Setting up monitoring for memcached..."

template "/etc/collectd/plugins/memcached_listener_plugin" do
  source "memcached_listen_disabled_num_plugin.erb"
  mode "0755"
  variables(
    :tcp_port => node['memcached']['port'].to_i,
  )
  cookbook 'rsc_memcached'
end

# Set up memcached monitoring
collectd_plugin 'memcached' do
  template 'memcached.conf.erb'
  cookbook 'rsc_memcached'
  options({
      :host =>   node['cloud']['private_ips'].first,
      :port =>node['memcached']['port'].to_i,
      :user => node["memcached"]["user"],
      :location => "/etc/collectd/plugins/memcached_listener_plugin",
      :uuid => node["rightscale"]["instance_uuid"]
    })
end
