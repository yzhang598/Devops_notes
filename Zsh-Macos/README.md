### Step 1: Install Zsh (this may not be necessary because Zsh has been installed in MacOs Catalina)
    brew install zsh

### Step 2: Install OhMyZsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Step 3: Change shell in Mac Terminal from Bash to Zsh
    chsh -s /bin/zsh

### Step 4: Open ~/.zshrc, change ZSH_THEME from "robbyrussell" to "agnoster"
    vi ~/.zshrc
    Change: ZSH_THEME="agnoster"

### Step 5: Install Powerline fonts
    # clone
    git clone https://github.com/powerline/fonts.git --depth=1
    # install
    cd fonts
    ./install.sh
    # clean-up a bit
    cd ..
    rm -rf fonts
    
### Step 6: Install Solarized color theme
Download [Solarized Dark.terminal](https://gist.githubusercontent.com/tringn/a5a3ec9cec58bceadc196d46e292161b/raw/a48bdefc4d3fe8531f474f442de00ffa02d5219e/Solarized%2520Dark.terminal) and install by double clicks on it.

### Step 7: Setup Apple Terminal with Solarized
Open terminal -> Preferences -> Profiles

  -> Select `Solarized%2520Dark` and choose as default
  
  -> Select `Text` Tab, Change Font to `Meslo LG S DZ Regular for Powerline`
