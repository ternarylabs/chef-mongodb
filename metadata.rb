maintainer        "Sebastian Wendel, SourceIndex IT-Services"
maintainer_email  "packages@sourceindex.de"
license           "Apache 2.0"
description       "Installs and configures the NoSQL Database MongoDB"
#long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.0"
recipe            "mongodb", "Installs and configures mongodb"
depends           "apt"
depends           "yum"

%w{redhat centos ubuntu debian}.each do |os|
  supports os
end

