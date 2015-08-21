# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias sb='source ~/.bash_profile'
alias eb='vi ~/.bash_profile'
alias pb='cat ~/.bash_profile'
# alias oi='ipython notebook --pylab=inline'
alias oi='ipython notebook'
alias cdf='cd ~/Documents/Fall\ 2014/'
alias ls='ls -Gp'
alias ev='vi ~/.vimrc'
alias rj='bundle exec jekyll serve'

# Function to find files with the specified string
fs() {
    find . -exec grep -l $1 {} \;
}

# Function to find the file whose name contains the specified substring
fn() {
    find . -iname "*$1*" -print;
}

# Function to find file whose name contains the specified substring from root directory
fnr() {
    find / -iname "*$1*" -print;
}
