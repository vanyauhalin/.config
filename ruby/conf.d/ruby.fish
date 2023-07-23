# # https://github.com/rbenv/ruby-build/blob/v20230512/README.md#custom-build-configuration
# set -gx RUBY_BUILD_BUILD_PATH $XDG_RUNTIME_DIR/ruby
# set -gx RUBY_BUILD_CACHE_PATH $XDG_CACHE_HOME/ruby

# https://github.com/ruby/ruby/blob/v3_3_0_preview1/doc/contributing/building_ruby.md#dependencies
set -gx RUBY_CONFIGURE_OPTS \
	--with-libyaml-dir=(command brew --prefix libyaml) \
	--with-openssl-dir=(command brew --prefix openssl@3) \
	--with-readline-dir=(command brew --prefix readline) \
	--with-zlib-dir=(command brew --prefix zlib)
