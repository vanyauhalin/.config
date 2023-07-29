eval (command brew shellenv)
set --export --global HOMEBREW_FORCE_BREWED_CURL 1
set --export --global HOMEBREW_FORCE_BREWED_GIT 1

set --local gnu_formulae \
	coreutils \
	make

for formula in $gnu_formulae
	fish_add_path (brew --prefix $formula)/libexec/gnubin
end

set --export --global CPPFLAGS
set --export --global LDFLAGS
set --export --global PKG_CONFIG_PATH

set --local formulae \
	autoconf \
	bison \
	bzip2 \
	curl \
	enchant \
	freetype \
	gd \
	gmp \
	icu4c \
	intltool \
	krb5 \
	libffi \
	libiconv \
	libjpeg \
	libpng \
	libpq \
	libtiff \
	libxml2 \
	libxslt \
	libyaml \
	libzip \
	mpfr \
	openssl@3 \
	readline \
	t1lib \
	tidy-html5 \
	unixodbc \
	webp \
	zlib

for formula in $formulae
	set --local prefix (brew --prefix $formula)
	set --local bin $prefix/bin
	set --local include $prefix/include
	set --local lib $prefix/lib
	set --local pkgconfig $lib/pkgconfig

	if test -e $bin
		fish_add_path $bin
	end
	if test -e $include
		set --append CPPFLAGS "-I$include"
	end
	if test -e $lib
		set --append LDFLAGS "-L$lib"
	end
	if test -e $pkgconfig
		set --append PKG_CONFIG_PATH $pkgconfig
	end
end
