site :opscode

metadata

cookbook 'collectd', github: 'rightscale-cookbooks-contrib/chef-collectd', branch: 'generalize_install_for_both_centos_and_ubuntu'
cookbook "driveclient", github: 'rightscale/rackspace_cookbooks',rel: "driveclient"
cookbook "cloudmonitoring",github: 'rightscale/rackspace_cookbooks',rel: "cloudmonitoring"
cookbook 'sysctl' , github: 'rs-services/cookbooks_internal',rel: "cookbooks/sysctl"
cookbook 'rightscale' , github: 'rightscale/rightscale_cookbooks',rel: "cookbooks/rightscale"
cookbook 'sys_dns' , github: 'rightscale/rightscale_cookbooks',rel: "cookbooks/sys_dns"

group :integration do
  cookbook 'apt', '~> 2.6.0'
  cookbook 'yum-epel', '~> 0.4.0'
 # cookbook 'curl', '~> 1.1.0'
 # cookbook 'fake', path: './test/cookbooks/fake'
 # cookbook 'rhsm', '~> 1.0.0'
end