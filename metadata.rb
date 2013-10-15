name              "golang"
maintainer        "Thomas Yang"
maintainer_email  "ywjno.dev@gmail.com"
license           "Apache 2.0"
description      "Installs go programming language"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.112.1"

recipe            "golang::default", "Installs go programing language."

%w{amazon arch centos debian fedora redhat scientific suse oracle ubuntu smartos}.each do |os|
  supports os
end
