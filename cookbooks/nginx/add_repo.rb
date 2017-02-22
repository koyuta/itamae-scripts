file "/etc/yum.repos.d/nginx.repo" do
	user "root"
	content <<-EOL
[nginx]
name=nginx repo
baseurl=#{node["nginx"]["baseurl"]}
gpgcheck=0
enabled=1
	EOL
end
