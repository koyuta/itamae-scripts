include_recipe "../../cookbooks/nginx/default.rb"

remote_file "/etc/logrotate.d/nginx" do
	user "root"
	mode "644"
end

remote_file "/etc/nginx/nginx.conf" do
	user "root"
	notifies :reload, "service[nginx]"
end
