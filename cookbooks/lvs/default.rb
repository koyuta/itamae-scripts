%w(ipvsadm keepalived).each do |pkg|
	package pkg do
		user "root"
	end
end

service "keepalived" do
	user "root"
	action [:enable, :start]
end
