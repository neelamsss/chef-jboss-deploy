#
# Cookbook Name:: jboss-deploy
# Recipe:: default
#


deployer 'example.war' do
	_jboss_home '/opt/jboss-6.2.0'
	_owner 'jboss'
	_group 'jboss'
	_package_url 'file:///root/example.war'
	_module_name 'example.war'
	mgmtport 9999
	_offset 0
	action :deploy
end
