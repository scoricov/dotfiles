# paths

# path priority for macports
export PATH=/opt/local/bin:/opt/local/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# basic
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim

# perl
export PERL_LOCAL_LIB_ROOT="$HOME/.perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "$HOME/.perl5"";
export PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5";
export PERL5LIB="$HOME/.perl5/lib/perl5:$PERL5LIB";

# Setting priority for MacPorts and MySQL executables
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/local/sbin:/usr/local/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export MAGICK_HOME="/opt/local/lib"

# go
export GOPATH=$HOME/Documents/Dev/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# java
##export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

