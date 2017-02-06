file "/etc/sudoers" do
	action :edit
	block do |content|
		content.gsub!(/[#|][ |\t]*Defaults passprompt.+/, "Defaults passprompt = \"%u@%h -> Password -> \"")
		content.gsub!(/[#|][ |\t]*Defaults timestamp_timeout.+/, "Defaults timestamp_timeout = 3")
	end
end

