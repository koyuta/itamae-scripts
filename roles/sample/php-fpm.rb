include_recipe "../../cookbooks/php-fpm/default.rb"

remote_file "/etc/php-fpm.conf" do
	user "root"
	mode "644"
end

service "php-fpm" do
	user "root"
	action :reload
end
