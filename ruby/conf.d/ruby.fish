# https://github.com/ruby/ruby/blob/v3_3_0_preview1/doc/contributing/building_ruby.md#dependencies
set --export --global RUBY_CONFIGURE_OPTS \
	--with-libyaml-dir=(brew --prefix libyaml) \
	--with-openssl-dir=(brew --prefix openssl@3) \
	--with-readline-dir=(brew --prefix readline) \
	--with-zlib-dir=(brew --prefix zlib)

set --export --global RUBY_YJIT_ENABLE 1
