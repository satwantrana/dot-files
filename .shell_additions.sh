# custom (machine specific) additions
CUSTOM_SHELL_ADDITIONS=".custom_shell_additions.sh"
if [ -e $CUSTOM_SHELL_ADDITIONS ]; then
  source $CUSTOM_SHELL_ADDITIONS
fi

# system stuff
alias sudo="sudo "
export VISUAL="vim"
export EDITOR="$VISUAL"

# fasd (file search)
which fasd >/dev/null
if [ "$?" -eq 0 ]; then
  eval "$(fasd --init auto)"
  alias v='f -e vim'
fi

# fzf (history search)
# can't use $SHELL as it's default shell not current shell, so we export
# $CURRENT_SHELL from the corresponding shell rc
FZF_DIRECTORY="/usr/share/fzf"
COMPLETION_SCRIPT="${FZF_DIRECTORY}/completion.${CURRENT_SHELL}"
KEY_BINDINGS_SCRIPT="${FZF_DIRECTORY}/key-bindings.${CURRENT_SHELL}"
[ -f "$COMPLETION_SCRIPT" ] && source "$COMPLETION_SCRIPT"
[ -f "$KEY_BINDINGS_SCRIPT" ] && source "$KEY_BINDINGS_SCRIPT"

# xdg config directoru
export XDG_CONFIG_HOME=~/.config
