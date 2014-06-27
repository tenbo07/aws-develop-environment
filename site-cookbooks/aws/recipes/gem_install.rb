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

  command "su - #{node[:default][:user]} -c 'cd #{tmp_dir} && bundle install'"
end
