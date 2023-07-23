# # https://github.com/rbenv/rbenv/blob/v1.2.0/README.md#environment-variables
# set -gx RBENV_ROOT $XDG_DATA_HOME/rbenv
set -gx RBENV_ROOT $HOME/.rbenv

status --is-interactive; and command rbenv init - fish | source
