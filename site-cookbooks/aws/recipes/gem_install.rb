tmp_dir="/tmp/gem_install"

directory "#{tmp_dir}" do
  owner 'root'
  mode 0777
  action :create
end

template "#{tmp_dir}/Gemfile"  do
  source 'gemfile.erb'
  owner node[:default][:user]
  group node[:default][:group]
  mode '0744'
  variables({
      :gem_packages => node[:gem][:package]
  })
  notifies :run, 'execute[bundle install]'
end

execute "bundle install" do
  action :nothing
  user node[:default][:user]
  group node[:default][:group]
  cwd "/home/#{node[:default][:user]}"
  environment "HOME" => "/home/#{node[:default][:user]}"
  command "cd #{tmp_dir} && bundle install"
end
