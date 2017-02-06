pkg = "mysql57-community-release-el6-7.noarch"

remote_file "/usr/local/src/#{pkg}.rpm" do
	user "root"
end

package "/usr/local/src/#{pkg}.rpm" do
	user "root"
	action :install
	not_if "rpm -q #{pkg}"
end

server = "mysql-community-server"

package server do
	user "root"
	action :install
	not_if "rpm -q #{server}"
end

service "mysqld" do
	user "root"
	action [:enable, :start]
end
