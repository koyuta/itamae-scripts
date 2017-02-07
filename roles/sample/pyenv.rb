include_recipe "../../cookbooks/pyenv/default.rb"

python_version = "3.6.0"

execute "source /etc/profile;pyenv install #{python_version}" do
	user "root"
	not_if "source /etc/profile;pyenv versions | grep #{python_version}"
end

execute "source /etc/profile;pyenv global #{python_version}" do
	user "root"
	not_if "source /etc/profile;python -V | grep #{python_version}"
end

%w(libjpeg-devel).each do |pkg|
	package pkg
end
