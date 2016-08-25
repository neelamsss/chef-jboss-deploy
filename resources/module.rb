resource_name :module

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