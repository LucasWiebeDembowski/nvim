# neovim config
## Ubuntu
### Install vim-plug
```
sudo apt install git curl
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Clone this repo to ${XDG_DATA_HOME:-$HOME/.config}

Then in nvim run `:PlugInstall`. If there are plugins defined it will install them, if not it says no plugins to install. Without vim-plug you'll get a "Not an editor command" error.  
`:PlugUpdate` will update the plugins.

### Nerd font needed for render-markdown
Download LiterationMono Nerd Font from https://www.nerdfonts.com/font-downloads and note that it's called Literation not Liberation.  
If using WSL then see the Nerd Font section under Windows to get it working in Windows Terminal.  
If using actual Ubuntu:  
`unzip ~/Downloads/LiterationMono.zip -d ~/.fonts`  
`fc-cache -fv`

### Editing the config
To source current file: `:source %`  
To install plugins that haven't been installed yet remember to source init.lua and run `:PlugInstall`

### Treesitter
nvim-treesitter is unnecessary and isn't worth the time anyway.

### LSP
`sudo apt install clangd` to install C/C++ language server, for other servers look it up.  
For clangd (see [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clangd)) create symlink to compile_commands.json for your project in the project root directory, example:  
`ln -s "$(pwd)/build/compile_commands.json" $(pwd)`  

lua: `:MasonInstall lua-language-server` (Notes: Mason only installs things for neovim, not the whole system. :MasonInstall has tab-completion to see what is available).

In neovim `:checkhealth vim.lsp` to check if it's working.  
Ctrl-] to go to definition, Ctrl-t to return. grr for all references, press enter on one of them to go to that. grn to rename.

### blink.cmp (for completions):  
`sudo apt install rustc`

## Windows
### Nerd Font
Download and unzip the same nerd font as for Ubuntu.  
Select all the ttf files with Mono in the name, right-click, install. Close all instances of Windows terminal, reopen it and right click the title bar, Settings, Defaults, Appearance, Font face, LiterationMono Nerd Font Mono.

### Config
`cd ~\AppData\Local`  
Clone the repo.  
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```
`winget install junegunn.fzf`  
`winget install -e --id OpenJS.NodeJS.LTS`  
Open powershell as administrator.  
`Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine`  
`npm --version`  
Then in neovim `:MasonInstall typescript-language-server`
`:MasonInstall eslint-lsp`
`:MasonInstall clangd`

