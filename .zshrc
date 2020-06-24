# Path to your oh-my-zsh installation.
#
export ZSH=/Users/dangilbert/.oh-my-zsh
export EDITOR=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# #export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gradle z osx lazy-nvm lazy-rbenv)

# User configuration

#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gf="git flow feature"
alias git="hub"
alias watchlg="watch --color git lg2 --color=always"
alias watchst="watch --color git status"

alias unixtime="date +%s"
alias cptime="date +%s | pbcopy"

alias nproc='sysctl -n hw.ncpu'

alias ae='adb_extended'
alias fixproxy='killall java' #Fix gradle using the proxy when it shouldn't

alias readlink=greadlink

prunelocal() {
  git branch --merged | egrep -v "(^\*|master|dev|beta|prod)" | xargs git branch -d
}

listmergedremote() {
  git branch -r --merged | egrep -v "(\*|master)"
}

forcedojojob() {
  adb shell cmd jobscheduler run --force com.classdojo.android 47
}

DEFAULT_USER="dangilbert"

export PATH=$PATH:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools:~/Library/Android/sdk/ndk-bundle:~/Library/Android/sdk/tools/bin
export PATH=$PATH:~/.composer/vendor/bin:~/bin
export PATH=$PATH:/usr/local/m-cli
export PATH=$PATH:/usr/local/mysql/bin
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/dangilbert/kotlin-native/bin"
export PATH=${PATH/:\/usr\/local\/bin} 
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

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

export ANDROID_HOME=~/Library/Android/sdk
alias vlc='~/Applications/VLC.app/Contents/MacOS/VLC'

function adball(){
      adb devices | egrep '\t(device|emulator)' | cut -f 1 | xargs -t -J% -n1 -P5 \
                  adb -s % "$@"
}

alias andcap='adb shell screencap /sdcard/screen.png && adb pull /sdcard/screen.png'
function andcapt() {
  adb shell screencap /sdcard/screen.png && adb pull /sdcard/screen.png screen-`echo $(($(date +'%s + %-N / 1000000')))`.png
}
alias adburl='adb shell am start -a android.intent.action.VIEW -d'
alias killdojo='adb shell am force-stop com.classdojo.android'

alias message='curl -s http://whatthecommit.com/ | grep '"'"'<p>'"'"'| cut -c 4-'
alias readme='pandoc -s -f markdown -t man README.md | groff -T utf8 -man | less'

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


alias officeproxy='ssh -D 9000 office'

alias electrum='python ~/bin/Electrum/electrum'

alias classDojoChecks='./gradlew ktlintFormat codeQualityCheck testDebugUnitTest --stacktrace && classDojoLint'
alias classDojoLint='./gradlew lint'

export MOE_HOME="~/.moe/moe-sdk-1.2.4"

# ClassDojo iOS signing

HOCKEYAPP_TOKEN=***REMOVED***; export HOCKEYAPP_TOKEN;
HOCKEYAPP_BETA_ID=***REMOVED***; export HOCKEYAPP_BETA_ID;
MATCH_PASSWORD=***REMOVED***; export MATCH_PASSWORD;

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ANDROID_NDK_ROOT=~/Library/Android/sdk/ndk-bundle

#$(aws ecr get-login --no-include-email --region us-east-1)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/dangilbert/.sdkman"
[[ -s "/Users/dangilbert/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dangilbert/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dangilbert/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dangilbert/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dangilbert/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dangilbert/bin/google-cloud-sdk/completion.zsh.inc'; fi

function chtitle {
    echo -ne "\033]0;"$*"\007"
}

export HOMEBREW_GITHUB_API_TOKEN=***REMOVED***

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn


export NOMAD_ADDR=https://nomad.internal.classdojo.com

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
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export MATCH_GIT_BASIC_AUTHORIZATION=***REMOVED***

source /usr/local/share/antigen/antigen.zsh

export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
export PATH="$PATH:/Users/dangilbert/Work/Flutter/flutter/bin"

function gitsquash {
  git reset $(git merge-base master $(git rev-parse --abbrev-ref HEAD))
  git add -A
}

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
