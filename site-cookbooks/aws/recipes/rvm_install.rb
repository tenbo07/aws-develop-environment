rvm_dependency = %w{gcc-c++ patch readline readline-devel}
rvm_dependency.concat(%w{zlib zlib-devel libffi-devel})
rvm_dependency.concat(%w{openssl-devel make bzip2 autoconf automake libtool bison})
rvm_dependency.concat(%w{gdbm-devel tcl-devel tk-devel})
rvm_dependency.concat(%w{libxslt-devel libxml2-devel})
rvm_dependency.each { |pkg| package pkg }

rvm_dependency_epel = %w{libyaml-devel}
rvm_dependency_epel.each { |pkg| package pkg }

execute "install_rvm" do
  command "su - vagrant -c 'curl -L https://get.rvm.io | bash -s stable'"
  not_if "su - vagrant -c 'which rvm'"
end

execute "rvm_ruby-2.0.0" do
  command "su - vagrant -c 'rvm install 2.0.0'"

  not_if "su - vagrant -c 'rvm list | grep 2.0.0'"
end

execute "set_default_ruby" do
  command "su - vagrant -c 'rvm use 2.0.0 --default'"

  not_if "su - vagrant -c 'rvm list | grep ^=\\* | grep 2.0.0'"
end