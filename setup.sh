sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

sed "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"spaceshipp\"/g" ~/.zshrc

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install python zsh-syntax-highlighting zsh-autosuggestions tmux exa go docker-compose goreleaser/tap/goreleaser

brew tap homebrew/caskfonts
# Switch iTerm font to Fira.
brew cask install font-fira-code

pip3 install powerline-status

git clone https://github.com/powerline/fonts.git --depth=1

./fonts/install.sh

echo "source /usr/local/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh\nsource /usr/local/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh\nexport SAVEHIST=5000\n" >> ~/.zshrc

git clone https://github.com/joshdick/onedark.vim.git

cat <<EOT >> ~/.vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
EOT


touch ~/.tmux.conf

cat <<EOT >> ~/.tmux.conf
bind P paste-buffer
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-selection
bind-key -T copy-mode-vi r send-keys -X rectangle-toggle
set-option -g history-limit 10000
bind \ split-window -h -c '#{pane_current_path}'  # Split panes horizontal
bind - split-window -v -c '#{pane_current_path}'  # Split panes vertically
EOT

cat <<EOT >> ~/.bashrc
export LANG=en_US.utf8
export GOPATH="\${HOME}/.go"
export GOROOT="\$(brew --prefix golang)/libexec"
export PATH="\$PATH:\${GOPATH}/bin:\${GOROOT}/bin"
alias ls='exa -lhga'
EOT

defaults write com.apple.Finder AppleShowAllFiles true

source ~/.bashrc

source ~/.zshrc

killall Finder

# Don't forget to install Docker for Mac via their website! Setup iTerm with TheOne theme.
