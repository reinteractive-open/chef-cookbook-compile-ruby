version    = node.default.ruby.version
patchlevel = node.default.ruby.patchlevel
ruby_name  = "ruby-#{version}-p#{patchlevel}"
src        = "#{ruby_name}.tar.gz"
download   = "http://ftp.ruby-lang.org/pub/ruby/1.9/#{ruby_name}.tar.gz"

bash "download and install ruby" do
  user "root"
  cwd "/tmp"
  code <<-EOF
  echo "Downloading #{download} to $PWD"
  wget #{download}
  echo "Extracting $PWD/#{src}"
  tar -zxvf #{src}
  cd /tmp/#{ruby_name}/
  echo "Configuring $PWD/configure"
  ./configure
  make
  sudo make install
  echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
  sudo gem install bundler
  EOF
end
