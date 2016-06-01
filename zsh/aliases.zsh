
alias b="bundle exec"
alias bs="brew services"
alias -g se='| grep -i'
# alias vim='/Applications/MacVim.app/Contents/MacOS/vim'
alias -s log="less -MN"
alias -s rb=vim
alias gdw="git diff --color-words"
alias dcom="docker-compose"
alias dockerip='docker ps | tail -n +2 | while read cid b; do echo -n "$cid\t"; docker inspect $cid | grep IPAddress | cut -d \" -f 4; done'
