# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# How many commands to store in history
HISTSIZE=10000
SAVEHIST=10000

# Share history in every terminal session
setopt -o sharehistory

# keybindings
bindkey '^ ' autosuggest-accept

# env
export PATH='/home/michael/nvidia/nvidia/NVIDIA-Nsight-Graphics-2024.1/host/linux-desktop-nomad-x64':$PATH
export PATH='/home/michael/intel/oneapi/vtune/latest/bin64':$PATH
export PATH='/home/michael/nvidia/NVIDIA-Nsight-Graphics-2024.1/host/linux-desktop-nomad-x64':$PATH
export PATH=$PATH:/home/michael/.cargo/bin
export QT_QPA_PLATFORM=xcb
export SDL_VIDEODRIVER=x11
export EDITOR='nvim'
export CMAKE_GENERATOR=Ninja

# aliases
alias ls='lsd'
alias l='lsd -lh'
alias la='lsd -A'
alias history='history 1 -1'

eval "$(zoxide init zsh)"

alias cppref="open ~/Development/Mirrors/cppreference.com/index.html"
alias nsight-graphics=ngfx-ui
alias anime=ani-cli
alias movies="lobster -i"
alias open=xdg-open

alias untar='tar -zxvf'
alias mkdir='mkdir -pv'
alias cd='z'
alias cat='bat'

alias sudo=doas
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

function preview() {
  case "$(uname -a)" in
    *Darwin*) UEBERZUG_TMP_DIR="$TMPDIR" ;;
    *) UEBERZUG_TMP_DIR="/tmp" ;;
  esac

  cleanup() {
    ueberzugpp cmd -s "$SOCKET" -a exit
  }
  trap cleanup HUP INT QUIT TERM EXIT

  UB_PID_FILE="$UEBERZUG_TMP_DIR/.$(uuidgen)"
  ueberzugpp layer --no-stdin --silent --use-escape-codes --pid-file "$UB_PID_FILE"
  UB_PID=$(cat "$UB_PID_FILE")

  export SOCKET="$UEBERZUG_TMP_DIR"/ueberzugpp-"$UB_PID".socket
  export X=$(($(tput cols) / 2 + 1))
  # --max-width $FZF_PREVIEW_COLUMNS --max-height $FZF_PREVIEW_LINES
  # if FZF_PREVIEW_COLUMNS exists, use it, otherwise use tput cols
  [ -z "$FZF_PREVIEW_COLUMNS" ] && max_width=$(($(tput cols) - 2)) || max_width=$FZF_PREVIEW_COLUMNS
  [ -z "$FZF_PREVIEW_LINES" ] && max_height=$(($(tput lines) - 2)) || max_height=$FZF_PREVIEW_LINES

  # run fzf with preview
  printf $(fzf --reverse --preview="ueberzugpp cmd -s $SOCKET -i fzfpreview -a add -x $X -y 1 --max-width $max_width --max-height $max_height -f {}")

  ueberzugpp cmd -s "$SOCKET" -a exit
}
