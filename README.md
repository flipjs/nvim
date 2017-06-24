# My Neovim Setup

## Install

- Clone it to ~/.config/nvim
- Install vim-plug. Go to [https://github.com/junegunn/vim-plug] for installation instructions
- Run nvim and do :PlugInstall

## Post-install
- Locate and change directory to tern_for_vim plugin and run `npm install`
  - Install tern - `npm install -g tern`
  - Ensure you have `.tern-project` in your home directory. Maybe you have a copy in your dotfiles
- Install prettier - `npm install -g prettier`
- Install silver searcher - `brew install the_silver_searcher`
- Install ctags - `brew install ctags-exuberant`
- Install jsctags - `npm install -g git+https://github.com/ramitos/jsctags.git`
- Run :CheckHealth and fix if any

## Useful Links
- [Neovim, Deoplete, JSPC, UltiSnips and Tern: A config for kickass autocompletion](https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/)

## License

MIT © [Felipe Apostol](https://github.com/flipjs)
