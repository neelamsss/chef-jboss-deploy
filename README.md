# jboss-deploy Cookbook

This cookbook deploys war files in jboss-eap server for both standalone and domain modes. 

## Requirements

### Platforms

- RHEL/CentOS
- jboss-eap 6.4

### Chef

- Chef 12.0 or later

### Cookbooks

- `toaster` - jboss-deploy needs toaster to brown your bagel.

## Attributes


### jboss-deploy::default

## Custom Resources

### utilize

The full syntax for all the properties that are available to the `utilize` resource is:

```
deployer 'name' do
    
deployer 'name' do
    
      _file_path 	String, default: '/tmp'
      _owner 		String, default: 'root'
      _group 		String, default: 'root'
      _mode 		String, default: '644'
      _package_url 	String
      _checksum 	String
      _module_name 	String
      _host 		String, default: '127.0.0.1'
      _offset 		Integer, default: 0
      _jboss_mode 	String, default: 'standalone'
      _jboss_home 	String, default: '/opt/jboss/'
      mgmtport 		Integer, default: 9999
      action        Symbol, default: deploy
      
end
      
end

```
where

* `_file_path` is the temporary download location.
* `_owner` is the OS user.
* `_group` is the OS user group.
* `_mode` defines the permissions.
* `_package_url` is the package URL.
* `_checksum` is the checksum of the package. (sha256)
* `_module_name` defines the name of the module.
* `_host` host name for `cli` access.
* `_offset` defines the offset of the jboss instances.
* `_jboss_mode` defines the jboss mode, default `standalone`.
* `_jboss_home` is the location of Jboss home directory.
* `mgmtport` is the Jboss management port.
* `action` must be set as `deploy` or `undeploy`.


## Usage

### jboss-deploy::default

Just include `jboss-deploy` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[jboss-deploy]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: Janith (janith@member.fsf.org)

