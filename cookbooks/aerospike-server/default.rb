execute "install aerospike server" do
	user "root"
	command <<-EOL
curl -L 'http://aerospike.com/download/server/#{node["aerospike"]["version"]}/artifact/el7' > aerospike.tgz
mkdir aerospike
tar zxvf aerospike.tgz -C aerospike --strip-components 1
cd aerospike
./asinstall
	EOL
	cwd "/usr/local/src"
	not_if "rpm -qa | grep aerospike"
end

service "aerospike" do
	user "root"
	action [:enable, :start]
end
