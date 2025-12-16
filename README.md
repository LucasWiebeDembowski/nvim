# neovim config
### Install vim-plug
```
sudo apt install git curl
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Clone this repo to ${XDG_DATA_HOME:-$HOME/.config}

Then in nvim run `:PlugInstall`. If there are plugins defined it will install them, if not it says no plugins to install. Without vim-plug you'll get a "Not an editor command" error.  

### Nerd font needed for render-markdown
Download and unzip LiterationMono Nerd Font from https://www.nerdfonts.com/font-downloads and note that it's called Literation not Liberation.  
##### Windows
Select all the ttf files with Mono in the name, right-click, install. Close all instances of Windows terminal, reopen it and right click the title bar, Settings, Defaults, Appearance, Font face, LiterationMono Nerd Font Mono.
##### Linux
`unzip ~/Downloads/LiterationMono.zip -d ~/.fonts`  
`fc-cache -fv`

### Editing the config
To source current file: `:source %`  
To install plugins that haven't been installed yet remember to source init.lua and run `:PlugInstall`

### Treesitter
This config does this automatically but to install a parser for a language, e.g. lua: `:TSInstall lua`, then to turn on highlighting `:TSBufEnable highlight`  

### LSP
`sudo apt install clangd` to install C/C++ language server, for other servers look it up.  
For clangd (see [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clangd)) create symlink to compile_commands.json for your project in the project root directory, example:  
`ln -s "$(pwd)/build/compile_commands.json" $(pwd)`  

lua: `:MasonInstall lua-language-server` (Notes: Mason only installs things for neovim, not the whole system. :MasonInstall has tab-completion to see what is available).

In neovim `:checkhealth vim.lsp` to check if it's working.  
Ctrl-] to go to definition, Ctrl-t to return. grr for all references, press enter on one of them to go to that. grn to rename.
