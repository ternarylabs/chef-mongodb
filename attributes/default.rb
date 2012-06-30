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
default['mongodb']['server_path'] = "/usr/share/mongodb"
default['mongodb']['server_etc'] = "/etc/mongodb"
default['mongodb']['server_pid'] = "/var/run/mongodb"
default['mongodb']['server_lock'] = "/var/lock/mongodb"
default['mongodb']['server_logs'] = "/var/log/mongodb"
default['mongodb']['server_data'] = "/var/lib/mongodb"
default['mongodb']['server_user'] = "mongodb"
default['mongodb']['server_group'] = "mongodb"

