# The asdf-pnpm plugin doesn't support having its own library directory for each
# version of pnpm.
# https://github.com/jonathanmorley/asdf-pnpm/issues/15

set --export --global PNPM_HOME $XDG_DATA_HOME/pnpm
fish_add_path $PNPM_HOME
