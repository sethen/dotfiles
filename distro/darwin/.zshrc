# source chruby and switch to ruby version
if [[ -f $CHRUBY_SHELL_FILE && -f $RUBY_BIN ]]; then
  source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
  chruby $RUBY_VERSION
fi
