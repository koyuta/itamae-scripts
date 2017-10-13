include_recipe "../../cookbooks/aerospike-server/default.rb"

remote_file "/etc/aerospike/aerospike.conf" do
	user "root"
	mode "644"
	notifies :restart, "service[aerospike]"
end
