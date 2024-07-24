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
  VENV_PATH="./venv/bin/activate"

  if [ -f "$VENV_PATH" ]; then
    . "$VENV_PATH"
  else
    PYTHON_VERSION=$(python3 --version)
    read -p "Would you like to create a venv with $PYTHON_VERSION? [y/N] " -n 1 -r
    echo # Newline
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      python3 -m venv venv && . "$VENV_PATH"
    fi
  fi
}

# Vars
export EDITOR=vim
