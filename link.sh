#!/bin/zsh
# links all DOT_FILES_DIR to their respective place

set -e

DOT_FILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
USER_HOME_DIR=~
DOT_FILES=( \
.bashrc \
.ctags \
.gitconfig \
.inputrc \
.shell_additions.sh \
.tmux.conf \
.vimrc \
.zshrc \
)

FORCE_SYMLINKS=0
if [[ "$1" = "-f" || "$1" -eq "--force" ]]; then
  echo "Forced symlinks creation enabled"
  FORCE_SYMLINKS=1
fi

for f in "${DOT_FILES[@]}"; do
  SOURCE_PATH="${DOT_FILES_DIR}/$f"
  TARGET_PATH="${USER_HOME_DIR}/$f"

  if [[ ! -e "$SOURCE_PATH" ]]; then
    echo "Skipping $f because it doesn't exist in $DOT_FILES_DIR"
  elif [[ FORCE_SYMLINKS -eq 0 && -e "$TARGET_PATH" ]]; then
    echo "Skipping $f because it already exists in $USER_HOME_DIR"
  else
    echo "Linking $SOURCE_PATH to $TARGET_PATH"

    FLAGS=""
    if [[ FORCE_SYMLINKS -eq 1 ]]; then
      FLAGS="${FLAGS}f"
    fi

	  ln -s$FLAGS "$SOURCE_PATH" "$TARGET_PATH"
  fi
done
