# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=/Users/tfoldi/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
#ZSH_THEME=wezm
ZSH_THEME=powerlevel10k

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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

# fzf
export FZF_BASE=/opt/homebrew/Cellar/fzf/0.44.1/shell/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker aws dirhistory lein zsh-autosuggestions zsh-syntax-highlighting fzf kubectl azcli)

# User configuration

export PATH="/usr/local/bin:/sbin:/usr/sbin:/Users/tfoldi/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/tfoldi/Library/Android/sdk/ndk-bundle:$HOME/Library/Haskell/bin:~/Library/Android/sdk/platform-tools"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
alias vim=$EDITOR

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# my lovely PS1
#export PS1='[%B%n@%m%b]$(git_prompt_info)%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )%{$fg[yellow]%}%#%{$reset_color%} '

# to store dotfiles in github
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

# kubectl
function kube-attach {
    if [[ $# = 0 ]]
    then
        echo "kubectl-attach requires 1 argument! Exiting."
    else
        kubectl exec -it $1 $2 $3 $4 -- bash
    fi
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tfoldi/Developer/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tfoldi/Developer/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tfoldi/Developer/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tfoldi/Developer/google-cloud-sdk/completion.zsh.inc'; fi


# hadoop cluster related aliases and envs
export HCAT_HOME=/usr/local/opt/hive/libexec/hcatalog
alias hstart="/usr/local/Cellar/hadoop/2.8.0/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.8.0/sbin/start-yarn.sh"
alias dfsstart="/usr/local/Cellar/hadoop/2.8.0/sbin/start-dfs.sh"
alias hstop="/usr/local/Cellar/hadoop/2.8.0/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.8.0/sbin/stop-dfs.sh"
alias dfsstop="/usr/local/Cellar/hadoop/2.8.0/sbin/stop-dfs.sh"

# Mono, .NET
export PATH=/usr/local/share/dotnet:/Library/Frameworks/Mono.framework/Versions/Current/bin/:${PATH}
export PATH="/usr/local/opt/libxml2/bin:$PATH"
if [ /opt/homebrew/bin/kubectl ]; then source <(kubectl completion zsh); fi
if [ /opt/homebrew/bin/pulumi ]; then source <(/opt/homebrew/bin/pulumi completion zsh 2>/dev/null); fi


#haskell 
# source /Users/tfoldi/.ghcup/env

eval $(/opt/homebrew/bin/brew shellenv) 

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion



unset SSH_AUTH_SOCK


#export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tfoldi/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tfoldi/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/tfoldi/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tfoldi/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/tfoldi/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/tfoldi/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

