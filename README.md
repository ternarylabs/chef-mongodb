# Description #
A cookbook for Opscodes Chef iopen-source systems integration framework to install and configure MongoDB. A scalable, high-performance, open source NoSQL database written in C++.

* Document-oriented storage
* Full Index Support
* Replication & High Availability
* Auto-Sharding
* Querying
* Fast In-Place Updates
* Map/Reduce
* GridFS

http://www.mongodb.org

It uses the stable release repository provided by 10gen.

http://www.10gen.com

# Requirements #

## Platform ##
The Cookbooks is build for the following platforms:
* Debian, Ubuntu
* CentOS, Red Hat

The Cookbooks is tested on the following platforms:
* Debian 6.05
* Ubuntu 10.04.4, 12.04
* CentOS 5.8, 6.2

## Cookbooks ##
To install the coockbook use the following commands:

    gem install librarian
    cd chef-repo
    librarian-chef init

    cat >> Cheffile <<END_OF_CHEFFILE
    cookbook 'mongodb', :git => 'https://github.com/sebwendel/chef-mongodb.git'
    END_OF_CHEFFILE

    librarian-chef install

    knife cookbook upload mongodb

# Recipes #
Just include the mongodb cookbock in your runlist or server role with the following hash table:

    {
      "run_list": [
        "recipe[mongodb]"
      ]
    }

This will install the java dependencie, the mongodb server and the declared plugins.

# Attributes #
* `node['mongodb']['interface']` - "127.0.0.1" limit to local access, default is "0.0.0.0".
* `node['mongodb']['port']` = database listener port, default is "27017".
* `node['mongodb']['nojournal']` = to disable journaling, default is "false".
* `node['mongodb']['logging_verbose']` = enable verbose logging, default is "false".
* `node['mongodb']['logging_cpu']` = enable cpu usage logging, default is "false".
* `node['mongodb']['oplogging']` = configure operation log, default is "0".
* `node['mongodb']['nohttp']` = disable http rest interface, default is "false".

# Limitations #
At the moment the cookbook just contains a single node procedure.

# ToDos and Issues #
Have a lock at the github issues section. There's still some work to do, patches are more than welcome.

# License and Author #

Author: Sebastian Wendel, (<packages@sourceindex.de>)

Copyright: 2012, SourceIndex IT-Serives

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
