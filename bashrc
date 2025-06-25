# == Distro Specific Config Goes Above ==

# Debian Prompt
parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\] $(parse_git_branch)\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi

# Functions
vv() {
  # Quick python venv
  VENV_DIR_NAME=$(find . -maxdepth 2 -name pyvenv.cfg | head -n 1 | cut -d'/' -f 1-2)
  VENV_PATH="$VENV_DIR_NAME/bin/activate"

  if [ -f "${VENV_PATH}" ]; then
    . "${VENV_PATH}"
    return
  fi

  DEFAULT_VENV="./venv/bin/activate"
  if [[ ${1} =~ ^[Yy]$ ]]; then
    python3 -m venv venv && . "$DEFAULT_VENV"
  else
    PYTHON_VERSION=$(python3 --version)
    read -p "Would you like to create a venv with ${PYTHON_VERSION}? [y/N] " -n 1 -r
    echo # Newline
    if [[ ${REPLY} =~ ^[Yy]$ ]]; then
      python3 -m venv venv && . "$DEFAULT_VENV"
    fi
  fi
}

# Vars
export EDITOR=vim

# History
# append to the history file, don't overwrite it
shopt -s histappend
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# max number of lines for history file
export HISTFILESIZE=20000
# keep 10000 commands of history
export HISTSIZE=10000
