eval "$(zoxide init zsh)"

alias anime=ani-cli
alias movies=lobster
alias open=xdg-open

alias untar='tar -zxvf'
alias mkdir='mkdir -pv'
alias cd='z'

alias l='ls -lh'
alias la='ls -A'

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

# export QT_QPA_PLATFORM=wayland
