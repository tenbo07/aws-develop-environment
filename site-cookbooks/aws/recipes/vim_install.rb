package 'vim'
package 'ctags'

#NeoBundle install
directory "/home/#{node[:default][:user]}/.vim" do
  owner node[:default][:user]
  mode 0775
  action :create
end

directory "/home/#{node[:default][:user]}/.vim/bundle" do
  owner node[:default][:user]
  mode 0775
  action :create
end

git "/home/#{node[:default][:user]}/.vim/bundle/neobundle.vim" do
  repository 'https://github.com/Shougo/neobundle.vim'
  reference 'master'
  action :sync
end

git "/home/#{node[:default][:user]}/.vim/bundle/vimproc" do
  repository 'https://github.com/Shougo/vimproc'
  reference 'master'
  action :sync
end

execute 'change owner' do
  user 'root'
  group 'root'
  command "chown -R #{node[:default][:user]}:#{node[:default][:group]} /home/#{node[:default][:user]}/.vim"
end

execute 'make vimproc' do
  not_if "ls /home/#{node[:default][:user]}/.vim/bundle/vimproc/autoload/vimproc_linux64.so"

  user node[:default][:user]
  group node[:default][:group]
  command "cd /home/#{node[:default][:user]}/.vim/bundle/vimproc && make -f make_unix.mak"
end


template "/home/#{node[:default][:user]}/.vimrc" do
  source 'vimrc.erb'
  owner node[:default][:user]
  group node[:default][:group]
  mode '0744'
  variables({
      :install_neobundle => node[:neobundle][:plugin]
  })
end
