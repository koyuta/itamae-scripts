remote_file "/usr/local/src/redis-2.4.10-1.el6.x86_64.rpm" do
	user "root"
end

package "redis-2.4.10-1.el6.x86_64.rpm" do
	user "root"
	cwd "/usr/local/src"
	not_if "rpm -qa | grep redis"
end
