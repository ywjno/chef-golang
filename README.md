Description
===========

Installs go programming language by the archive file.

Requirements
============

## Platform:

* Arch
* CentOS
* Debian
* Fedora
* RHEL
* Ubuntu


Here is supported until. Tested in Ubuntu.

Attributes
==========

See `attributes/default.rb` for default values.

* `node["golang"]["version"]` - golang version to install, default is `1.1.2` now.
* `node["golang"]["prefix"]` - golang install directory, default is `/usr/local`.
* `node["golang"]["path"]` - the `$GOPATH` directory, default is `/opt/golang`.

if you want install other golang version, you will set the `node["golang"]["checksum"]` value with the tarball file SHA256 checksum.

Usage
=====

    { "run_list": ["recipe[chef-golang]"] }

License and Author
==================

Author:: Thomas Yang <ywjno.dev@gmail.com>

Copyright:: 2013, Thomas Yang

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
