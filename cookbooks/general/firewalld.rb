service "firewalld" do
	user "root"
	action [:enable, :start]
end

execute "firewall-cmd --add-port=22/tcp --zone=public --permanent" do
	user "root"
	not_if "firewalld-cmd --list-ports | grep 22/tcp"
	notifies :run, "execute[firewall-cmd --reload]"
end

execute "firewall-cmd --add-port=80/tcp --zone=public --permanent" do
	user "root"
	not_if "firewalld-cmd --list-ports | grep 80/tcp"
	notifies :run, "execute[firewall-cmd --reload]"
end

execute "firewall-cmd --add-port=443/tcp --zone=public --permanent" do
	user "root"
	not_if "firewalld-cmd --list-ports | grep 443/tcp"
	notifies :run, "execute[firewall-cmd --reload]"
end

execute "firewall-cmd --reload" do
	user "root"
	notifies :restart, "service[nginx]"
end
