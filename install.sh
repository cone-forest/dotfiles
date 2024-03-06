#!/bin/bash

read -p "You sure you read the source code? (Y/n) " resp
if [ -z "$resp" ] || [ "$resp" = "n" ]; then
  echo "I am speechless..."
  exit
fi;

spinner_t=jump

# For beautiful spinning anomation
yay -S gum --noconfirm >> install.log

# Get system packages
# Install shell tools
gum spin --spinner $spinner_t --title "Installing zoxide..." -- yay -S zoxide --noconfirm > install.log
# Install programming tools
gum spin --spinner $spinner_t --title "Installing git..." -- yay -S git --noconfirm > install.log

# Install neovim
gum spin --spinner $spinner_t --title "Installing neovim..." -- yay -S neovim --noconfirm > install.log

# lua
gum spin --spinner $spinner_t --title "Installing lua..." -- yay -S lua luarocks lua-language-server --noconfirm >> install.log

# c/cpp
gum spin --spinner $spinner_t --title "Installing c/cpp tools..." -- yay -S llvm clang clangd lldb codelldb cmake cmake-language-server clang-format cmake-lint --noconfirm >> install.log

# rust
gum spin --spinner $spinner_t --title "Installing rustup..." -- yay -S rustup --noconfirm >> install.log

gum spin --spinner $spinner_t --title "Installing rust stable toolchain..." -- rustup toolchain install stable --noconfirm >> install.log

# python
gum spin --spinner $spinner_t --title "Installing python tools..." -- yay -S python python-pynvim python-debugpy mypy perf ueberzug --noconfirm >> install.log

# golang
gum spin --spinner $spinner_t --title "Installing golang tools..." -- yay -S go gopls --noconfirm >> install.log

# Install document tools
gum spin --spinner $spinner_t --title "Installing document tools..." -- yay -S texlive-langcyrillic texlive-xetex texlive-bin texlive-binextra texlive-latex texlive-latexextra texlive-luatex texlive-mathscience texlive-pictures texlive-revtex texlive-subfiles --noconfirm >> install.log

gum spin --spinner $spinner_t --title "Installing markdown..." -- yay -S markdown --noconfirm >> install.log

gum spin --spinner $spinner_t --title "Installing ascii-image-converter..." -- yay -S ascii-image-converter --noconfirm >> install.log

# Get packer
gum spin --spinner $spinner_t --title "Installing packer..." -- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim >> install.log
gum spin --spinner $spinner_t --title "Installing tpm..." -- git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install adb
gum spin --spinner $spinner_t --title "Installing adb..." -- yay -S android-tools scrcpy --noconfirm > install.log

gum spin --spinner $spinner_t --title "Installing vpn..." -- yay -S wireguard resolvconf --noconfirm > install.log

# You wish to install neovim config?
read -p "You wish to install neovim config? (Y/n) " resp
if [ -z "$resp" ] || [ "$resp" = "y" ]; then
  cp -r nvim ~/.config/
  nvim -c PackerSync >> install.log
fi;

# You wish to install tmux config?
read -p "You wish to install tmux config? (Y/n) " resp
if [ -z "$resp" ] || [ "$resp" = "y" ]; then
  cp -r tmux ~/.config/
  tmux source-file ~/.config/tmux/tmux.conf
fi;

# You wish to install tmux config?
read -p "You wish to install kitty config? (Y/n) " resp
if [ -z "$resp" ] || [ "$resp" = "y" ]; then
  cp -r kitty ~/.config/
fi;

# You wish to install tmux config?
read -p "You wish to install zsh config? (Y/n) " resp
if [ -z "$resp" ] || [ "$resp" = "y" ]; then
  cat zsh.sh >> ~/.zshrc
fi;

gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 50 --margin "1 2" --padding "2 4" \
  'Done' 'Now you are cool ;)' '(You can delete this directory)'

