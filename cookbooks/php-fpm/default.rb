package "php-fpm" do
	user "root"
	action :install
	options "--enablerepo=remi-php70"
end

service "php-fpm" do
	user "root"
	action [:enable, :start]
end
