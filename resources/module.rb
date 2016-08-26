resource_name :module


property :_owner, String, default: 'root'
property :_module_name, String
property :_host, String, default: '127.0.0.1'
property :_offset, Integer, default: 0
property :_jboss_mode, String, default: 'standalone'
property :_jboss_home, String, default: '/opt/jboss/'
property :mgmtport, Integer, default: 9999
property :_jdbc_loc, String
property :_dep_list, String
property :_jdbc_driver_name, String

action :create do 

    execute 'module-add' do
 	user _owner
 	command _jboss_home+
	    '/bin/jboss-cli.sh --connect controller='+
	    _host+':'+
	    "#{mgmtport+_offset}"+
	    ' --commands="module add --name='+_module_name+' --resources='+_jdbc_loc+' --dependencies='+_dep_list+'"'
     end
     execute 'install-jdbc' do
       user _owner
       command _jboss_home+
	    '/bin/jboss-cli.sh --connect controller='+
	    _host+':'+
	    "#{mgmtport+_offset}"+
	    ' --commands="/subsystem=datasources/jdbc-driver='+_jdbc_driver_name+':add(driver-name='+_jdbc_driver_name+',driver-module-name='+_module_name+')"'
     end

end