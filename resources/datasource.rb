resource_name :datasource

property :_owner, String, default: 'root'
property :_host, String, default: '127.0.0.1'
property :_offset, Integer, default: 0
property :_jboss_mode, String, default: 'standalone'
property :_jboss_home, String, default: '/opt/jboss/'
property :mgmtport, Integer, default: 9999
property :_jdbc_driver_name, String
property :_user, String
property :_password, String
property :_dt_name, String
property :_connection_url, String
property :_jndi_name, String

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

