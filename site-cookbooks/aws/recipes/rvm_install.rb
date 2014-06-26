execute 'install_rvm' do
  command "su - #{node[:rvm][:user]} -c 'curl -L https://get.rvm.io | bash -s stable'"
  not_if "su - #{node[:rvm][:user]} -c 'which rvm'"
end

execute 'rvm install ruby-2.0.0' do
  command "su - #{node[:rvm][:user]} -c 'rvm install 2.0.0'"
  not_if "su - #{node[:rvm][:user]} -c 'rvm list | grep 2.0.0'"
end

execute 'set default ruby' do
  command "su - #{node[:rvm][:user]} -c 'rvm use ruby-2.0.0 --default'"
  not_if "su - #{node[:rvm][:user]} -c 'which ruby | grep rvm'"
end
