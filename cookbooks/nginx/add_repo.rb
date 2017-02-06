package "http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm" do
	user "root"
	action :install
	not_if "rpm -q nginx-release-centos-6-0.el6.ngx.noarch"
end

remote_file "/etc/yum.repos.d/nginx.repo" do
	user "root"
end
