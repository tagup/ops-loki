function install_or_upgrade { 
  brew ls | grep $1 > dev/null;
  if (($? == 0));
    then brew upgrade $1;
    else brew install $1;
  fi    
}

# Default tools for administration / troubleshouting / General purpose

# Install xcode 
xcode-select --install

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install_or_upgrade "brew-cask-completion"

# Install OpenSSL
install_or_upgrade "openssl"
# Force link openSSL
brew link openssl --force

# Install Wget
install_or_upgrade "wget"

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Tunnelblick
brew cask install tunnelblick

# Iterm2
brew cask install iterm2

# The unarchiver
brew cask install the-unarchiver

# Amphetamine
brew cask install amphetamine
# ===========================

# Generic tools used by Tagup

# Slack
brew cask install slack

# Keybase
brew cask install keybase

# Google Chrome
brew cask install google-chrome

# Google File Stream (instead of backup-and-sync)
brew cask install google-drive-file-stream

# Microsoft VS-Code
brew cask install visual-studio-code

# Docker
brew cask install docker

# Microsoft office 365
brew cask install microsoft-office

# InfluxDB (Mainly for the CLI)
brew install influxdb