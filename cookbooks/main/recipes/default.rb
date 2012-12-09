package "git-core"

include_recipe "nginx::source"

group "admin" do
  gid 420
end

user node[:user][:name] do
  password node[:user][:password]
  gid 420
  home "/home/#{node[:user][:name]}"
  supports manage_home: true
end