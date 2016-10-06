# puppet-test 
This puppet setup is based on a non master-agent where the puppet
repo is hosted on the node itself that will run the  **puppet apply**.
Modules are defined in node.pp using the default node.
Modify the node.pp to remove or add additonal modules.
etc-puppet folder has main master config file for example if setting 
up a master server.

####Command to use module. 
```
puppet apply manifests/site.pp --modulepath=~/puppet/modules/ --verbose --detailed-exitcodes
```
####Example of puppet directory:
```
root@nginx:/var/puppet-test# tree
.
├── manifests
│   ├── nodes.pp
│   └── site.pp
├── modules
│   └── nginx
│       ├── files
│       │   ├── default.conf
│       │   ├── index.html
│       │   └── nginx.conf
│       └── manifests
│           └── init.pp
└── README.md

5 directories, 7 files
root@nginx:/var/puppet-test#
```
