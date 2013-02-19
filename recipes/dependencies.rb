
# TODO: clean this mess up

execute "updating apt repository"  do
  command "sudo apt-get -y update"
end

execute "install dependencies" do
  command "sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev libcurl4-openssl-dev curl git-core python-software-properties"
end
