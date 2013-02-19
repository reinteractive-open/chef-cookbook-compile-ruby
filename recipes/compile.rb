version    = default.ruby.version
patchlevel = default.ruby.patchlevel
ruby_name  = "ruby-#{version}-p#{patchlevel}"

bash "download and install ruby" do
  user "root"
  cwd "/tmp"
  code <<-EOF
  wget http://ftp.ruby-lang.org/pub/#{version}ruby/#{version}/ruby-#{ruby_name}.tar.gz
  tar -xvzf ruby-#{ruby_name}.tar.gz
  cd ruby-#{ruby_name}/
  ./configure
  make
  sudo make install
  echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
  sudo gem install bundler
  EOF
end
