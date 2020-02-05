# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=$HOME/.yadr

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# YADR support
alias yav='yadr vim-add-plugin'
alias ydv='yadr vim-delete-plugin'
alias ylv='yadr vim-list-plugin'
alias yup='yadr update-plugins'
alias yip='yadr init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'
alias psj='ps aux | grep java'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
TRAPHUP() {
  source $yadr/zsh/aliases.zsh
}

alias ae='code $yadr/zsh/aliases.zsh' #alias edit
alias aev='vim $yadr/zsh/aliases.zsh'
alias ar='source $yadr/zsh/aliases.zsh'  #alias reload
alias gar="killall -HUP -u \"$USER\" zsh"  #global alias reload

# vim using
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim="mvim -v"
fi

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='code ~/.vimrc'
alias vev='vim ~/.vimrc'
alias vr='source ~/.vimrc'

# path editing
alias pe='code $yadr/zsh/0_path.zsh'
alias pev='vim $yadr/zsh/0_path.zsh'
alias pr='source $yadr/zsh/0_path.zsh'

# zsh profile editing
alias ze='code ~/.zshrc'
alias zev='vim ~/.zshrc'
alias zr='source ~/.zshrc'

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='code .gitignore'
alias giv='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias gap='git add -p'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

# Ruby
alias c='rails c' # Rails 3
alias co='script/console' # Rails 2
alias cod='script/console --debugger'

#If you want your thin to listen on a port for local VM development
#export VM_IP=10.0.0.1 <-- your vm ip
alias ts='thin start -a ${VM_IP:-127.0.0.1}'
alias ms='mongrel_rails start'
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'

alias ka9='killall -9'
alias k9='kill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# TODOS
# This uses NValt (NotationalVelocity alt fork) - http://brettterpstra.com/project/nvalt/
# to find the note called 'todo'
alias todo='open nvalt://find/todo'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Zeus
# alias zs='zeus server'
# alias zc='zeus console'
# alias zr='zeus rspec'
# alias zrc='zeus rails c'
# alias zrs='zeus rails s'
# alias zrdbm='zeus rake db:migrate'
# alias zrdbtp='zeus rake db:test:prepare'
# alias zzz='rm .zeus.sock; pkill zeus; zeus start'

# Rspec
alias rs='rspec spec'
alias sr='spring rspec'
alias src='spring rails c'
alias srgm='spring rails g migration'
alias srdm='spring rake db:migrate'
alias srdt='spring rake db:migrate'
alias srdmt='spring rake db:migrate db:test:prepare'


# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
alias spb="git checkout -b \`sp | tail -2 | grep '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"

alias hpr='hub pull-request'
alias grb='git recent-branches'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias dbtp='spring rake db:test:prepare'
alias dbm='spring rake db:migrate'
alias dbmr='spring rake db:migrate:redo'
alias dbmd='spring rake db:migrate:down'
alias dbmu='spring rake db:migrate:up'

# Homebrew
alias brewu='brew update  && brew upgrade && brew cleanup && brew doctor'

# Python and Pip
alias pipl='pip list'
alias pipi='pip install'
alias pipup='pip install --upgrade'
alias pipf='pip freeze'
alias pipun='pip uninstall'
alias pipconf='vim ~/.pip/pip.conf'

alias mkv='mkvirtualenv'
alias lsv='lsvirtualenv'

# Python and Pip
alias pl='pip list'
alias pi='pip install'
alias pup='pip install --upgrade'
alias preq='pip install -Ur'
alias pf='pip freeze'
alias pun='pip uninstall'
alias pc='code ~/.pip/pip.conf'
alias pcv='vim ~/.pip/pip.conf'
alias mkv='mkvirtualenv'
alias lsv='lsvirtualenv -b'
alias rmv='rmvirtualenv'
alias cpv='cpvirtualenv'
alias cdv='cdvirtualenv'
alias de='deactivate'
alias ave='workon'
alias pyclean='find . -name "*.pyc" -exec rm -f {} \;'

 # Node and npm
alias npmig='npm install -g'
alias npmlg='npm list -g'
alias npmog='npm outdated -g'
alias npmupg='npm update -g'
alias npmung='npm uninstall -g'
alias npmi='npm install'
alias npml='npm list'
alias npmo='npm outdated'
alias npmup='npm update'
alias npmun='npm uninstall'

alias fuck='$(thefuck $(fc -ln -1))'

alias dl="docker ps -l -q" # Get latest container ID
alias dcl="docker container ls" # Get list of containers
alias dps="docker ps" # Get container process
alias dpa="docker ps -a" # Get process included stop container
alias drun="docker run" # Run container
alias di="docker images" # Get images
alias dil="docker image ls" # Get list of images
alias dvl="docker volume ls" # Get list of volumes
alias dnl="docker network ls" # Get list of networks
alias dinfo="docker info" # System and docker info
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'" # Get container IP
alias dkd="docker run -d -P" # Run deamonized container, e.g., $dkd base /bin/echo hello
alias dki="docker run -i -t -P" # Run interactive container, e.g., $dki base /bin/bash
alias dex="docker exec -i -t" # Execute interactive container, e.g., $dex base /bin/bash
alias dsp="docker system prune -f" # Removes stopped containers, unused networks, dangling images, and all build cache
alias dcp="docker container prune" # Prune stopped containers
alias dvp="docker volume prune" # Prune unused volumes
alias dip="docker image prune" # Prune unused images
alias dclogs="docker-compose logs" # Compose logs
dstop() { docker stop $(docker ps -a -q); } # Stop all containers
drm() { docker rm $(docker ps -a -q); } # Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)' # Stop and Remove all containers
dri() { docker rmi $(docker images -q); } # Remove all images
dbu() { docker build -t=$1 .; } # Dockerfile build, e.g., $dbu tcnksm/test
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; } # Show all alias related docker
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; } # Bash into running container

alias vscodefix='sudo chown -R $USER ~/Library/Caches/com.microsoft.VSCode.ShipIt/ && xattr -dr com.apple.quarantine /Applications/Visual\ Studio\ Code.app'
