# paths

# path priority for macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# basic
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim

# perl
export PERL_LOCAL_LIB_ROOT="$HOME/.perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "$HOME/.perl5"";
export PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5";
export PERL5LIB="$HOME/.perl5/lib/perl5:$PERL5LIB";

# go
export PATH="$HOME/.perl5/bin:$PATH";
export PATH="/usr/local/go/bin:$PATH";
export GOPATH="$HOME/.gocode"

