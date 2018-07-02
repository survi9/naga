# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

execute "apt-get update" do
  command "apt-get update -y"
end


package 'github' do
  action :install
end

service 'github' do
  action [ :enable, :start ]
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
