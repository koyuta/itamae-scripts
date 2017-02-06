file "/etc/ssh/sshd_config" do
	action :edit
	block do |content|
		content.gsub!(/^[#|][ |\t]*Port \d+$/, "Port 70022")
		content.gsub!(/^[#|][ |\t]*PermitRootLogin yes$/, "PermitRootLogin without-password")
		content.gsub!(/^[#|][ |\t]*ChallengeResponseAuthentication yes$/, "ChallengeResponseAuthentication no")
		content.gsub!(/^[#|][ |\t]*Protocol 2$/, "Protocol 2")
		content.gsub!(/^[#|][ |\t]*LoginGraceTime .+$/, "LoginGraceTime 30")
		content.gsub!(/^[#|][ |\t]*MaxAuthTries .+$/, "MaxAuthTries 5")
	end
end

service "sshd" do
	action :restart
end
