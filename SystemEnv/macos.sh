#https://github.com/romkatv/powerlevel10k
# Go to Preferences... > Profiles > Keys (not Preferences... > Keys)
# On current versions (3.14+) you then switch to the Key Mappings tab
# Press Presets... dropdown button.
# Select Natural Text Editing

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

source ~/.zshrc

brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

exec zsh

export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc

brew install gpg