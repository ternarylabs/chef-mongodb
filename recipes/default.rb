#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2012, SourceIndex IT-Serives
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

case node['platform']
when "debian", "ubuntu"
  apt_repository "10gen" do
    uri "http://downloads-distro.mongodb.org/repo/debian-sysvinit"
    distribution "dist"
    components ["10gen"]
    keyserver "keyserver.ubuntu.com"
    key "7F0CEB10"
    action :add
  end

  include_recipe 'apt'

  packages = %w{mongodb-10gen}
  packages.each do |pkg|
    package pkg do
      action :install
    end
  end

when "centos","redhat"
  if node['kernel']['machine'] =~ /x86_64/
    arch = "x86_64"
  else
    arch = "i686"
  end
  yum_repository "10gen" do
    url "http://downloads-distro.mongodb.org/repo/redhat/os/#{arch}/"
    failovermethod "priority"
    action :add
  end

  include_recipe 'yum'

  packages = %w{mongo-10gen mongo-10gen-server}
  packages.each do |pkg|
    package pkg do
      action :install
    end
  end

else
  Chef::Log.warn("The #{node['platform']} is not yet not supported by this cookbook")
end

case node['platform']
when "debian", "ubuntu"
  template "/etc/mongodb.conf" do
    source "mongodb.conf.erb"
    owner "root"
    group "root"
    mode 0644
  end
when "centos","redhat"
  template "/etc/mongod.conf" do
    source "mongodb.conf.erb"
    owner "root"
    group "root"
    mode 0644
  end
end

case node['platform']
when "debian", "ubuntu"
  service "mongodb" do
    supports :restart => true, :status => true
    action [:enable, :start]
  end

when "centos","redhat"
  service "mongod" do
    supports :restart => true, :status => true
    action [:enable, :start]
  end
end

