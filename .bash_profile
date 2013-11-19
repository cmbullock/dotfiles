
if [ -e ~/.bashrc ]; then
	source ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Case-insensitive globbing
shopt -s nocaseglob

