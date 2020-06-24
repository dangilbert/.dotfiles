### Uncomment the following line and zprof at the end of this file to profile
#zmodload zsh/zprof

export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim

ZSH_THEME="powerlevel9k/powerlevel9k"

COMPLETION_WAITING_DOTS="true"

DEFAULT_USER="dangilbert"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gradle z osx lazy-nvm lazy-rbenv)

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"

# Path config
export ANDROID_HOME=$HOME/Library/Android/sdk
FLUTTER_HOME=$HOME/Work/Flutter

export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/ndk-bundle:$ANDROID_HOME/tools/bin
export PATH=$PATH:~/.composer/vendor/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/m-cli
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$HOME/.fastlane/bin:$PATH
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
export PATH=/usr/local/sbin:$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin  
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$PATH
export PATH=$PATH:$FLUTTER_HOME/flutter/bin
export PATH=$PATH:$HOME/.pub-cache/bin

source ~/.zshrc-private

# Git commands
alias git="hub"
alias watchlg="watch --color git lg2 --color=always"
alias watchst="watch --color git status"

prunelocal() {
  git branch --merged | egrep -v "(^\*|master|dev|beta|prod)" | xargs git branch -d
}

listmergedremote() {
  git branch -r --merged | egrep -v "(\*|master)"
}

alias unixtime="date +%s"
alias cptime="date +%s | pbcopy"

alias nproc='sysctl -n hw.ncpu'

alias readlink=greadlink

exip () {
    # gather external ip address
    echo -n "Current External IP: "
    curl -s -m 5 http://icanhazip.com
}

ips () {
    # determine local IP address
    ifconfig | grep "inet " | awk '{ print $2 }'
}

gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# Android functions

alias ae='adb_extended'
alias adburl='adb shell am start -a android.intent.action.VIEW -d'

function disable_animations {
  adb shell settings put global window_animation_scale 0
  adb shell settings put global transition_animation_scale 0
  adb shell settings put global animator_duration_scale 0
}

function enable_animations {
  adb shell settings put global window_animation_scale 1
  adb shell settings put global transition_animation_scale 1
  adb shell settings put global animator_duration_scale 1
}



alias message='curl -s http://whatthecommit.com/ | grep '"'"'<p>'"'"'| cut -c 4-'
alias readme='pandoc -s -f markdown -t man README.md | groff -T utf8 -man | less'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias vlc='~/Applications/VLC.app/Contents/MacOS/VLC'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ANDROID_NDK_ROOT=~/Library/Android/sdk/ndk-bundle

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/bin/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/bin/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/bin/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/bin/google-cloud-sdk/completion.zsh.inc"; fi

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

function blowAwayGradle {
  rm *.iml
  rm -rf ~/.gradle/caches/
}

function crushpngs {
  for file in *.png; do pngcrush "$file" "${file%.png}-crushed.png" && mv "${file%.png}-crushed.png" "$file"; done
}

function pdftopng {
  for i in *.pdf; do sips -s format png "${i}" --out "${i%pdf}png"; done
}

function pngtowebp {
   for i in *.png; do cwebp "${i}" -o "${i%png}webp"; done
 }

function pdftores {
  pdftopng
  npm
  asset-generator *.png --android res 
  find res -name '*.png' | xargs -I {} sh -c "original=\"{}\"; output=\"\${original%png}webp\"; cwebp \"\$original\" -o  \"\$output\"; rm \"\$original\""
}

function gitsquash {
  git reset $(git merge-base master $(git rev-parse --abbrev-ref HEAD))
  git add -A
}

source /usr/local/share/antigen/antigen.zsh

#zprof
