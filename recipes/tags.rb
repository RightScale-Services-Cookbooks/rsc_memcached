#
# Cookbook Name:: rsc_memcached
# Recipe:: tags
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

marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

include_recipe 'machine_tag'

machine_tag 'memcached:state=active'
machine_tag "memcached:server=#{RsApplicationMemcached::Helper.get_bind_ip_address(node)}"
machine_tag "memcached:port=#{node['memcached']['port'].to_i}"
machine_tag 'rs_monitoring:state=active'