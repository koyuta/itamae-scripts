execute "easy_install supervisor" do
	user "root"
end

directory "/etc/supervisor" do
	user "root"
	mode "755"
end

directory "/etc/supervisor/conf.d" do
	user "root"
	mode "755"
end

execute "echo_supervisord_conf > supervisord.conf" do
	user "root"
	cwd "/etc/supervisor"
	not_if "ls -n /etc/supervisor/supervisord.conf"
end

remote_file "/etc/init.d/supervisord" do
	user "root"
	mode "755"
end

service "supervisord" do
	user "root"
	action [:start, :enable]
end
