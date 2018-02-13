
alias fs='foreman start'
alias g='git'
alias h='history | grep'
alias ls='ls -G'
alias mksshkey="ssh-keygen -b 8192 -t rsa -C '$1' -f ~/.ssh/$1.rsa"
alias viclean='rm -f .vimsession && vi'
alias statuswin='tmux split-window && tmux resize-pane -y 15'
alias urlencode='node -e "console.log(encodeURI(process.argv[1]))"'
alias map='xargs -n1'
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias karma="foreman run rake karma:${1:-run}"
alias spec='foreman run rake spec'
alias pbdecode='pbpaste | base64 -D'

for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m $method"
done

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true

. $(find /usr/local/Cellar/git -name git-prompt.sh)

for SCRIPT in ~/bash_completion.d/*; do . $SCRIPT; done

complete -o default -o nospace -F _git g
complete -o default -o nospace -F _git mg
complete -o default -o nospace -F _git megagit
complete -F _tas tas

export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.6.14.1
export EC2_URL=https://ec2.us-east-1.amazonaws.com

export EDITOR=vim
export HISTSIZE=
export HISTCONTROL=erasedups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date"
export PS1='$(EC=$? && echo "\[\033[0;32m\]\u@\h\[\033[0m\]:\[\033[0;34m\]\w\[\033[0;35m\]$(__git_ps1 " (%s)")\n$(if [[ $EC -ne 0 ]]; then echo "\e[0;31m[$EC]"; else echo "\[\e[1;30m\][0]"; fi) \[\e[1;30m\]$(date -u +%H.%M.%S) \[\033[0m\]»» ")'
export PROMPT_COMMAND='tabname $(basename ${PWD/#$HOME/~})$(__git_ps1 " (%s)")'
export PATH=$HOME/bin:$PATH:$HOME/.rvm/bin:$HOME/dev/devbin:$EC2_HOME/bin
export LANG=en_US
export LC_ALL="en_US.UTF-8"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_40.jdk/Contents/Home
export CC=/usr/local/bin/gcc-4.8
export CPP=/usr/local/bin/cpp-4.8
export CXX=/usr/log/bin/g++-4.8

source $HOME/dotfiles/secret.sh

function tabname {
	echo -ne "\033]0;$@\007"
}

function vimst {
  TMP=$(mktemp -t git_st)
  git status --porcelain | awk '{print $2":0:0"}' > $TMP
  vim -c copen -q $TMP
  rm -f $TMP
}

