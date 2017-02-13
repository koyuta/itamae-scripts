%w(
  git
  python-devel
  gcc
  gcc-c++
  zlib-devel
  bzip2
  bzip2-devel
  readline-devel
  sqlite
  sqlite-devel
  openssl-devel
).each do |pkg|
	package pkg do
		user "root"
	end
end

git "/opt/pyenv" do
	repository "https://github.com/yyuu/pyenv"
end

file "/etc/profile.d/pyenv.sh" do
	mode "644"
	content <<-EOL
export PYENV_ROOT="/opt/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
	EOL
end
