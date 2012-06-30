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
    uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
    distribution "dist"
    components ["10gen"]
    action :add
    notifies :run, "execute[apt-get update]", :immediately
  end

when "centos","redhat"
  arch = node['kernel']['machine'] =~ /x86_64/ ? "x86_64" : "i386"
  yum_repository "10gen" do
    url "http://downloads-distro.mongodb.org/repo/redhat/os/#{arch}/"
    failovermethod "priority"
    action :add
    notifies :run, "execute[yum update]", :immediately
  end

else
  Chef::Log.warn("The #{node['platform']} is not yet not supported by this cookbook")
end

packages = %w{mongodb-10gen}
packages.each do |pkg|
  package pkg do
    action :install
  end
end
