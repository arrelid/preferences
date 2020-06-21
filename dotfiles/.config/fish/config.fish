set -x fish_greeting
set -x LC_ALL "en_US.UTF-8"
set -x FZF_DEFAULT_OPTS "--layout=reverse --inline-info --cycle"
set -gx EDITOR vim
set -gx VISUAL vim

status --is-interactive; and . (pyenv init -| psub)
status --is-interactive; and . (rbenv init - | psub)
