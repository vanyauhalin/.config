set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

status --is-interactive; and command pyenv init - | source
