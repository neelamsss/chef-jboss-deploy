resource_name :deployer

property :_file_path, String, default: '/tmp'
property :_owner, String, default: 'root'
property :_group, String, default: 'root'
property :_mode, String, default: '644'
property :_package_url, String
property :_checksum, String
property :_module_name, String
property :_host, String, default: '127.0.0.1'
property :_offset, Integer, default: 0
property :_jboss_mode, String, default: 'standalone'
property :_jboss_home, String, default: '/opt/jboss/'
property :mgmtport, Integer, default: 9999
property :_sub_deploy, String, default: lazy {
    _jboss_mode == 'domain' ? '--server-groups=main-server-group' : ''
  }
property :_sub_undeploy, String, default: lazy {
    _jboss_mode == 'domain' ? '--all-relevant-server-groups' : ''
  }

action :deploy do
  
   remote_file _file_path+'/'+_module_name do
     source _package_url
     owner _owner
     group _group
     mode _mode
     action :create
   end
  
   execute 'jboss-cli-deploy' do
 	user _owner
 	command _jboss_home+
	    '/bin/jboss-cli.sh --connect controller='+
	    _host+':'+
	    "#{mgmtport+_offset}"+
	    ' --commands="deploy '+
	    _file_path+'//'+
	    _module_name+' '+
	    _sub_deploy+'"'
   end
   
end

action :undeploy do
  
   execute 'jboss-cli-undeploy' do
 	user _owner
 	command _jboss_home+
	    '/bin/jboss-cli.sh --connect controller='+
	    _host+':'+
	    "#{mgmtport+_offset}"+
	    ' --commands="undeploy '+
	    _module_name+' '+
	    _sub_undeploy+'"'
   end
   
end
