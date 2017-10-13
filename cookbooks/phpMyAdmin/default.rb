execute "git clone https://github.com/phpmyadmin/phpmyadmin.git -b STABLE" do
	user "root"
	cwd "/usr/share"
	not_if "ls -d /usr/share/phpmyadmin"
end

package "gettext" do
	user "root"
	action :install
end

execute "scripts/generate-mo" do
	user "root"
	cwd "/usr/share/phpmyadmin"
end

execute "/usr/local/bin/composer install" do
	user "root"
	cwd "/usr/share/phpmyadmin"
end
