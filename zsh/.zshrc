# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# keybindings
bindkey '^ ' autosuggest-accept

# env
export ARCHFLAGS="-arch native"
export PATH=$PATH:/home/michael/.cargo/bin
export QT_QPA_PLATFORM=wayland
export EDITOR='nvim'

# aliases
alias l='ls -lh'
alias la='ls -A'

eval "$(zoxide init zsh)"

alias anime=ani-cli
alias movies=lobster
alias open=xdg-open

alias untar='tar -zxvf'
alias mkdir='mkdir -pv'
alias cd='z'

alias nvim='nvim --listen /tmp/nvimsocket'
alias vim='nvim --listen /tmp/nvimsocket'
alias vi='nvim --listen /tmp/nvimsocket'
alias nv='nvim --listen /tmp/nvimsocket'

alias l='ls -lh'
alias la='ls -A'
alias upscale='sudo docker run --gpus all --device=/dev/nvidia0 --device=/dev/nvidiactl --runtime nvidia --privileged -it --rm -v $PWD:/host ghcr.io/k4yt3x/video2x:latest'

function mkfall() {
  mkdir $1
  cd $1
}

function cntloc() {
  curl -sL 'https://api.codetabs.com/v1/loc/?github='$1 | grep -E "language|linesOfCode"
}

function phone_stream() {
  phone_ip=$(abd shell ip route | awk '{print $9}')
  adb tcpip 5555
  adb connect $phone_ip:5555
  scrcpy
}

function private() {
  sudo wg-quick up frkn-nl
}

function public() {
  sudo wg-quick down frkn-nl
}
