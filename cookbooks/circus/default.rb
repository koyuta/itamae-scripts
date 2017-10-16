execute "source /etc/profile;pip install circus" do
	user "root"
end

directory "/etc/circus" do
	user "root"
	mode "644"
end

directory "/var/log/circus" do
	user "root"
	mode "644"
end

remote_file "/etc/init.d/circusd" do
	user "root"
	mode "755"
end

service "circusd" do
	user "root"
	action [:enable, :start]
end

