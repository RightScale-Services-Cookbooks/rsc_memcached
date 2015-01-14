

marker "recipe_start_rightscale" do
  template "rightscale_audit_entry.erb"
end

override['memcached']['listen'] = RsApplicationMemcached::Helper.get_bind_ip_address(node)

include_recipe 'memcached'