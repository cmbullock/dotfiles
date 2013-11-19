
alias fs='foreman start'
alias g='git'
alias h='history | grep'
alias ls='ls -G'
alias mksshkey="ssh-keygen -b 8192 -t rsa -C '$1' -f ~/.ssh/$1.rsa"
alias mg='megagit'
alias mp='megapull'
alias ms='megastatus'
alias viclean='rm -f .vimsession && vi'
alias statuswin='tmux split-window && tmux resize-pane -y 15'
alias urlencode='node -e "console.log(encodeURI(process.argv[1]))"'
alias map='xargs -n1'
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m $method"
done

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true

. /usr/local/git/contrib/completion/git-prompt.sh
. /usr/local/git/contrib/completion/git-completion.bash

for SCRIPT in ~/bash_completion.d/*; do . $SCRIPT; done

complete -o default -o nospace -F _git g
complete -o default -o nospace -F _git mg
complete -o default -o nospace -F _git megagit

export HISTCONTROL=erasedups
export HISTSIZE=
export PS1='\[\033[0;32m\]\u@\h\[\033[0m\]:\[\033[0;34m\]\w\[\033[0;35m\]$(__git_ps1 " (%s)")\n\[\033[0m\]»» '
export PROMPT_COMMAND='tabname $(basename ${PWD/#$HOME/~})'

export PATH=$PATH:/usr/local/heroku/bin:$HOME/.rvm/bin:$HOME/dev/devbin

function tabname {
	echo -ne "\033]0;$@\007"
}

function vimst {
  TMP=$(mktemp -t git_st)
  git status --porcelain | awk '{print $2":0:0"}' > $TMP
  vim -c copen -q $TMP
  rm -f $TMP
}

