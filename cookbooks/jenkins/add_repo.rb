execute "curl -OL http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo" do
	user "root"
	cwd "/etc/yum.repos.d"
	not_if "ls -n /etc/yum.repos.d/jenkins.repo"
end

execute "rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key" do
	user "root"
end
