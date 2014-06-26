tmp_dir="/tmp/gem_install"

directory "#{tmp_dir}" do
  owner 'root'
  mode 0777
  action :create
end

cookbook_file "#{tmp_dir}/Gemfile" do
  source 'Gemfile'
  owner node[:rvm][:user]
  group node[:rvm][:user]
  mode '0644'
end

execute "bundle install" do
  command "su - #{node[:rvm][:user]} -c 'cd #{tmp_dir} && bundle install'"
end
