# fvim - Open selected file in Vim
ffvi() {
  local file
  file=$(fzf --query="$1") && vim "$file"
}

# vif [QUERY]
# - Open the selected file with the default editor
#   (Bypass fuzzy finder when there's only one match)
vif() {
  local file
  # file=$(ffq1 "$1") && ${EDITOR:-vim} "$file"
  file=$(ffq1 "$1") && vim "$file"
}

# ffq1 [QUERY]
# - Immediately select the file when there's only one match.
#   If not, start the fuzzy finder as usual.
ffq1() {
  local lines
  lines=$(fzf --filter="$1" --no-sort)

  if [ -z "$lines" ]; then
    return 1
  elif [ $(wc -l <<< "$lines") -eq 1 ]; then
    echo "$lines"
  else
    echo "$lines" | fzf --query="$1"
  fi
}

# ffd - cd to selected directory
ffd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*'         \
                     -prune                \
                     -o -type d            \
                     -print 2> /dev/null | \
                     fzf +m -x             \
  ) && cd "$dir"
                     # fzf --query="$1" \
}

# ffda - including hidden directories
ffda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m -x) && cd "$dir"
}

# ffh - repeat history
ffh() {
  eval $(history | fzf +s -x| sed 's/ *[0-9]* *//')
}

# ffkill - kill process
ffkill() {
  ps -ef   | \
    sed 1d | \
    fzf -m | \
    awk '{print $2}' | \
    xargs kill -${1:-9}
}

# ffbr - checkout git branch
ffbr() {
  local branches branch
  branches=$(git branch) \
    && branch=$(echo "$branches" | fzf +s +m -x) \
    && git checkout $(echo "$branch" | sed "s/.* //")
}

# ffco - checkout git commit
ffco() {
  local commits commit
  commits=$(git log --pretty=oneline \
                    --abbrev-commit  \
                    --reverse)       \
    && commit=$(echo "$commits" | fzf +s +m -e) \
    && git checkout $(echo "$commit" | sed "s/ .*//")
}

# fftags - search ctags
fftags() {
  local line
  [ -e tags ] \
    && line=$(grep -v "^!" tags   | \
                      cut -f1-3   | \
                      cut -c1-80  | \
                      fzf --nth=1 ) \
    && $EDITOR $(cut -f2 <<< "$line")
}
