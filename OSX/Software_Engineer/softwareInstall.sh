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
brew link openssl --force

# Install Wget
install_or_upgrade "wget"

# InfluxDB (Mainly for the CLI) and MongoDB 3.6
install_or_upgrade "influxdb"
brew tap mongodb/brew
install_or_upgrade "mongodb-community@3.6"
echo 'export PATH="/usr/local/opt/mongodb-community@3.6/bin:$PATH"' >> ~/.zshrc

# Git
install_or_upgrade "git"

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install nvm and correct node version for Thor and Vili
install_or_upgrade "nvm"
nvm install 12.10.0 # For Thor
nvm install 10.17.0 # For Vili

# Yarn
install_or_upgrade "yarn"

# AWS CLI - V1 
mkdir ~/ForInstallAWSCLI
cd ~/ForInstallAWSCLI
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm -rf ~/ForInstallAWSCLI



# ===========================

# Online Tools
brew cask install slack google-drive-file-stream google-chrome brave-browser firefox

# Security Tools
brew cask install tunnelblick keybase

# Development Tools
brew cask install visual-studio-code robo-3t postman docker iterm2

# Utilities Tools
brew cask install the-unarchiver

# Office Tools
brew cask install microsoft-office
