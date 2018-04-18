source "$HOME/.sdkman/bin/sdkman-init.sh"
export M2_HOME=/Library/Maven/apache-maven-3.5.0
export PATH=$PATH:$M2_HOME/bin
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH=$PATH:$HOME/activator-dist-1.3.12/bin
export PATH=~/.local/bin:$PATH
export AWS_PROFILE=adminuser
export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"

# Add Redis.app binaries to path
# PATH="/Applications/Redis.app/Contents/Resources/Vendor/redis/bin:$PATH"
alias ll='ls -lG'

if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[31m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[36m\]\$(parse_git_branch)\[\033[00m\] $ "
