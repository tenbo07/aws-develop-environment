package 'git' do
 action :install
end

script 'git setting' do
  not_if {node[:git][:username] == "" && node[:git][:email] == ""}
  
  interpreter 'bash'
  user node[:default][:user]
  group node[:default][:group]
  cwd "/home/#{node[:default][:user]}"
  environment "HOME" => "/home/#{node[:default][:user]}"
  code <<-EOF
    git config --global user.name #{node[:git][:username]}
    git config --global user.email #{node[:git][:email]}
  EOF
end
