function __ruby_set_environment
	# set -gx BUNDLE_USER_CACHE $XDG_CACHE_HOME/bundle
	# set -gx BUNDLE_USER_CONFIG $XDG_CONFIG_HOME/bundle
	# set -gx BUNDLE_USER_PLUGIN $XDG_DATA_HOME/bundle

	# set -gx GEM_HOME $XDG_DATA_HOME/gem
	# set -gx GEM_SPEC_CACHE $XDG_CACHE_HOME/gem

	# # https://github.com/rbenv/rbenv/blob/v1.2.0/README.md#environment-variables
	# set -gx RBENV_ROOT $XDG_DATA_HOME/rbenv
	set -gx RBENV_ROOT $HOME/.rbenv

	# # https://github.com/rbenv/ruby-build/blob/v20230512/README.md#custom-build-configuration
	# set -gx RUBY_BUILD_BUILD_PATH $XDG_RUNTIME_DIR/ruby
	# set -gx RUBY_BUILD_CACHE_PATH $XDG_CACHE_HOME/ruby

	# https://github.com/ruby/ruby/blob/v3_3_0_preview1/doc/contributing/building_ruby.md#dependencies
	set -gx RUBY_CONFIGURE_OPTS \
		--with-libyaml-dir=(command brew --prefix libyaml) \
		--with-openssl-dir=(command brew --prefix openssl@3) \
		--with-readline-dir=(command brew --prefix readline) \
		--with-zlib-dir=(command brew --prefix zlib)
end

function __ruby_use_on_cd
	status --is-interactive; and command rbenv init - fish | source
end
