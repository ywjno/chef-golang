#
# Cookbook Name:: golang
# Attributes:: default
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

default['golang']['version'] = '1.1.2'
default['golang']['prefix'] = "/usr/local"
default['golang']['path'] = "/opt/golang"
if node['kernel']['machine'] =~ /x86_64/
  default['golang']['checksum'] = 'ad583ff91bd2955fc48d24001785587e3c3b5ce5c09e4971a37028db4c3f6a98'
else
  default['golang']['checksum'] = '56f384c973e58c098ec462bcd892a7c1166b9a392461970ddb22d57ed4d495af'
end
