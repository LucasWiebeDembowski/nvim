# nvim
neovim config based on https://github.com/BreadOnPenguins/nvim
### Side note: colour schemes
The colour scheme of neovim affects what colour codes the program sends to the terminal emulator, and the colour scheme of the terminal emulator affects how those codes look on screen.  
The default colour scheme in neovim sucks, which isn't the fault of the terminal emulator although it looks worse in the Windows Terminal (and in gnome-terminal run from WSL) than in gnome-terminal in Mint for example.  
The colour scheme can be set from within neovim with `:colorscheme <insert color scheme>` or you can tab after `:colorscheme` to see the list of options.
### Prerequisites for vim-plug
sudo apt install git curl
### Install vim-plug
```
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Clone this repo to ${XDG_DATA_HOME:-$HOME/.config}

Then in nvim run `:PlugInstall`. If there are plugins defined it will install them, if not it says no plugins to install. Without vim-plug you'll get a "Not an editor command" error.  

#### Nerd font needed for render-markdown
Download and unzip LiterationMono Nerd Font from https://www.nerdfonts.com/font-downloads and note that it's called Literation not Liberation.  
##### Windows
Select all the ttf files with Mono in the name, right-click, install. Close all instances of Windows terminal, reopen it and right click the title bar, Settings, Defaults, Appearance, Font face, LiterationMono Nerd Font Mono.

