rvm_dependency_pkgs=[
  "patch",
  "libyaml-devel",
  "libffi-devel",
  "glibc-headers",
  "autoconf",
  "gcc-c++",
  "glibc-devel",
  "patch",
  "readline-devel",
  "zlib-devel",
  "openssl-devel",
  "automake",
  "libtool",
  "bison"
]
rvm_dependency_pkgs.each {|pkg| package pkg}

execute 'install_rvm' do
  not_if "su - #{node[:default][:user]} -c 'which rvm'"
  command "su - #{node[:default][:user]} -c 'curl -L https://get.rvm.io | bash -s stable'"
end

execute 'rvm install ruby-2.0.0' do
  not_if "su - #{node[:default][:user]} -c 'rvm list | grep 2.0.0'"
  command "su - #{node[:default][:user]} -c 'rvm install 2.0.0'"
end

execute 'set default ruby' do
  not_if "su - #{node[:default][:user]} -c 'echo $rvm_ruby_string | grep -v system'"
  command "su - #{node[:default][:user]} -c 'rvm use ruby-2.0.0 --default'"
end
