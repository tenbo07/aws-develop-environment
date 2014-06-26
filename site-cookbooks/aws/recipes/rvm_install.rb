execute 'install_rvm' do
  not_if "su - #{node[:default][:user]} -c 'which rvm'"

  user node[:default][:user]
  group node[:default][:group]
  cwd "/home/#{node[:default][:user]}"
  environment "HOME" => "/home/#{node[:default][:user]}"
  command "curl -L https://get.rvm.io | bash -s stable"
end

execute 'rvm install ruby-2.0.0' do
  not_if "su - #{node[:default][:user]} -c 'rvm list | grep 2.0.0'"

  user node[:default][:user]
  group node[:default][:group]
  cwd "/home/#{node[:default][:user]}"
  environment "HOME" => "/home/#{node[:default][:user]}"
  command "source ~/.bash_profile && rvm install 2.0.0"
end

execute 'set default ruby' do
  not_if "su - #{node[:default][:user]} -c 'rvm list | grep ^=\\* | grep 2.0.0'"

  user node[:default][:user]
  group node[:default][:group]
  cwd "/home/#{node[:default][:user]}"
  environment "HOME" => "/home/#{node[:default][:user]}"
  command "source ~/.bash_profile && rvm use ruby-2.0.0 --default'"
end
