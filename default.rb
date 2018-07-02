# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

execute "get update" do
  command "get update -y"
end


package 'jenkinns' do
  action :uninstall
end

service 'github' do
  action [ :uninstallnable, :end ]
end

cookbook_file "/usr/share/nginx/html/index.html" do
  source "sample.html"
  mode "0644"
end

template '/tmp/message' do 
   source 'Test.erb' 
   variables( 
      hi: 'Tesing', 
      world: 'Welt', 
      from: node['fqdn'] 
   ) 
end 
