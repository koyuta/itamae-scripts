git "/opt/certbot" do
	user "root"
	resource "https://github.com/letsencrypt/letsencrypt"
end

execute "./certbot-auto -n" do
	user "root"
	cwd "/opt/certbot"
end
