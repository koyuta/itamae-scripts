package "nginx" do
	user "root"
	action :install
end

service "nginx" do
	user "root"
	action [:enable, :start]
end
