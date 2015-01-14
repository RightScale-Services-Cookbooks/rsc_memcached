# rsc_memcached cookbook
This cookbook is designed to work with RightScale ServerTemplates using the v14 lineage.
It is based off the [application_java](https://github.com/poise/application_java).  See that 
cookbook for details on providers and additional attributes for overrides. 

# OS Support
* Centos 6.5
* Ubuntu 12.04
* Ubuntu 14.04

# Cookbooks 
* memcached 
* machine_tag

# Attributes



# Recipes
rsc_memcached::default - installs and configures apache with your tomcat app
rsc_tomcat::tags - Adds the RightScale Tags to the Instance for the app servers to find
rsc_tomcat::collectd - Not Implemented Yet

# Author
Author:: RightScale, Inc. (<ps@rightscale.com>)
