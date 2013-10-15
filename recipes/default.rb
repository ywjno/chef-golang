#
# Cookbook Name:: golang
# Recipe:: default
#
# Copyright 2013, Thomas Yang
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

prefix = node['golang']['prefix']
path = node['golang']['path']
arch = node['kernel']['machine'] =~ /x86_64/ ? 'amd64' : '386'
tarball_name = "go#{node['golang']['version']}.linux-#{arch}.tar.gz"
file_cache_path = Chef::Config[:file_cache_path]

remote_file "#{file_cache_path}/#{tarball_name}" do
  source "http://go.googlecode.com/files/#{tarball_name}"
  owner "root"
  mode "0644"
  checksum node['golang']['checksum']
  not_if "test -f #{file_cache_path}/#{tarball_name}"
end

bash "install golang" do
  cwd file_cache_path
  code <<-EOH
    rm -rf go
    rm -rf #{prefix}/go
    tar -C #{prefix} -xzf #{tarball_name}
  EOH
  not_if "#{prefix}/go/bin/go version | grep #{node['golang']['version']}"
end

directory "#{prefix}/go" do
  action :create
  recursive true
  owner "root"
  group "root"
  mode "0755"
end

directory "#{path}" do
  action :create
  recursive true
  owner "root"
  group "root"
  mode "0755"
end

template "/etc/profile.d/golang.sh" do
  source "golang.sh.erb"
  owner "root"
  group "root"
  mode "0755"
  variables(
    'arch' => arch,
    'prefix' => prefix,
    'path' => path
  )
end
