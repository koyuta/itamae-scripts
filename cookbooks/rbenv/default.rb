%w(
  git
	gcc
	make
	openssl
	openssl-devel
	gcc-c++
	readline-devel
)

git "/opt/rbenv" do
	user "root"
	repository "https://github.com/sstephenson/rbenv.git"
end

file "/etc/profile.d/rbenv.sh" do
	user "root"
	mode "644"
	content <<-EOL
export RBENV_ROOT="/opt/rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
	EOL
end

directory "/opt/rbenv/plugins" do
	user "root"
end

git "/opt/rbenv/plugins/ruby-build" do
	user "root"
	repository "https://github.com/sstephenson/ruby-build.git"
end
