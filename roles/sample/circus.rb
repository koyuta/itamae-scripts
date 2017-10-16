directory "/var/log/front" do
	user "root"
	mode "644"
end

directory "/var/run/front" do
	user "root"
	mode "644"
end

template "/etc/circus/circusd.ini" do
	user "root"
	notifies :restart, "service[circusd]"
	variables(
		workdir: node["application"]["workdir"],
		optargs: node["application"]["optargs"],
	)
end
