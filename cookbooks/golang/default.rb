execute "download golang" do
	user "root"
	command "curl -OL https://storage.googleapis.com/golang/go#{node["go"]["version"]}.linux-amd64.tar.gz"
	cwd "/usr/local/src"
	not_if "ls -n #{node["go"]["root"]}/bin/go"
end

execute "sha256sum go#{node["go"]["version"]}.linux-amd64.tar.gz | grep #{node["go"]["hash"]}" do
	user "root"
	cwd "/usr/local/src"
	subscribes :run, "execute[download golang]", :immediately
	action :nothing
end

execute "tar zxvf go#{node["go"]["version"]}.linux-amd64.tar.gz" do
	user "root"
	cwd "/usr/local/src"
	subscribes :run, "execute[download golang]", :immediately
	action :nothing
end

execute "mv go #{node["go"]["root"]}" do
	user "root"
	cwd "/usr/local/src"
	not_if "ls -n #{node["go"]["root"]}"
end

file "/etc/profile.d/go.sh" do
	user "root"
	mode "644"
	content <<-EOL
export GOROOT="#{node["go"]["root"]}"
export PATH="$PATH:$GOROOT/bin"
	EOL
end
