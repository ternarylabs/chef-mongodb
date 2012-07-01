#
# Author:: Sebastian Wendel
# Cookbook Name:: mongodb
# Attribute:: default
#
# Copyright 2012, SourceIndex IT-Services
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# SERVER CONFIG
case node['platform']                                                                         
when "debian", "ubuntu"
  default['mongodb']['path_data'] = "/var/lib/mongodb"
  default['mongodb']['path_log'] = "/var/log/mongodb/mongodb.log"
when "centos","redhat"
  default['mongodb']['path_data'] = "/var/lib/mongo"
  default['mongodb']['path_log'] = "/var/log/mongo/mongod.log"
end
default['mongodb']['interface'] = "127.0.0.1"
default['mongodb']['port'] = 27017
default['mongodb']['nojournal'] = false
default['mongodb']['logging_verbose'] = false
default['mongodb']['logging_cpu'] = false
default['mongodb']['oplogging'] = 0
default['mongodb']['nohttp'] = false
