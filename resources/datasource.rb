resource_name :datasource


action :create do
  
     execute 'data-source' do
       user _owner
       command _jboss_home+
	    '/bin/jboss-cli.sh --connect controller='+
	    _host+':'+
	    "#{mgmtport+_offset}"+
	    ' --commands="data-source add --jndi-name=java:/'+_jndi_name+' --name='+_dt_name+' --connection-url='+_connection_url+
	    ' --driver-name='+_jdbc_driver_name+' --user-name='+_user+' --password='+_password+'"'
     end
     
end

