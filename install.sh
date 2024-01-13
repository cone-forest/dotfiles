#!/bin/bash

read -p "You sure you read the source code? (Y/n)" resp

# Get system packages
# Install neovim
echo "Installing neovim..."
echo "[=            ]   7%"
yay -S neovim > install.log

# Install programming tools
echo "Installing git..."
echo "[==           ]  15%"
yay -S git >> install.log

# lua
echo "Installing lua..."
echo "[===          ]  23%"
yay -S lua lua-language-server >> install.log

# c/cpp
echo "Installing c/cpp tools..."
echo "[====         ]  30%"
yay -S llvm clang clangd lldb codelldb cmake cmake-language-server clang-format cmake-lint >> install.log

# rust
echo "Installing rustup..."
echo "[=====        ]  38%"
yay -S rustup >> install.log

echo "Installing rust stable toolchain..."
echo "[======       ]  46%"
rustup toolchain install stable >> install.log

# python
echo "Installing python tools..."
echo "[=======      ]  53%"
yay -S python python-pynvim python-debugpy mypy perf ueberzug >> install.log

# golang
echo "Installing golang tools..."
echo "[========     ]  61%"
yay -S go gopls >> install.log

# Install document tools
echo "Installing document tools..."
echo "[=========    ]  69%"
yay -S texlive-langcyrillic texlive-xetex texlive-bin texlive-binextra texlive-latex texlive-latexextra texlive-luatex texlive-mathscience texlive-pictures texlive-revtex texlive-subfiles >> install.log

echo "Installing markdown..."
echo "[==========   ]  76%"
yay -S markdown >> install.log

echo "Installing ascii-image-converter..."
echo "[===========  ]  84%"
yay -S ascii-image-converter >> install.log

# Get packer
echo "Installing packer and tmp..."
echo "[============ ]  93%"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim >> install.log
git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# You wish to install neovim config?
read -p "You wish to install neovim config? (Y/n)" resp
if [ -z "$resp" ] || [ "$resp" = "y" ]; then
  cp -r nvim ~/.config/
  nvim -c PackerSync >> install.log
fi;

# You wish to install tmux config?
read -p "You wish to install tmux config? (Y/n)" resp
if [ -z "$resp" ] || [ "$resp" = "y" ]; then
  cp -r tmux ~/.config/
  tmux source-file ~/.config/tmux/tmux.conf
fi;

echo "[=============] 100%"
echo "Done!"

