package "java-1.8.0-openjdk" do
	user "root"
end

package "jenkins" do
	user "root"
end

service "jenkins" do
	user "root"
	action [:enable, :start]
end
