# My Neovim Setup

## Pre-install

- Install neovim - `brew install neovim/neovim/neovim`
- Install python3 - `brew install python3`
- Enable python3 interface - `pip3 install neovim`
- Install vim-plug - Go to [https://github.com/junegunn/vim-plug] for installation instructions

## Install

- Clone this repo to ~/.config/nvim
- Run nvim and do :PlugInstall
- Close and run nvim again, there should be no warning messages anymore

## Post-install

- Locate and change directory to tern_for_vim plugin and run `npm install`
  - Install tern - `npm install -g tern`
  - You might want to have `.tern-project` in your home directory
- Install prettier - `npm install -g prettier`
- Install silver searcher - `brew install the_silver_searcher`
- Install universal ctags
  - steps:
      ```
      git clone https://github.com/universal-ctags/ctags.git
      cd ctags
      ./autogen.sh 
      ./configure
      make
      sudo make install
      ```
- Install jsctags - `npm install -g git+https://github.com/ramitos/jsctags.git`
- Run :CheckHealth and fix if any
- You might need powerline fonts installed for your terminal
  - Go to [https://github.com/powerline/fonts] for installation instructions
  - For iTerm2 users, go to Profile, Text tab, and set BOTH font and non-ascii text to use powerline font

## Troubleshooting

Google is your friend

## Useful Links

- [Neovim, Deoplete, JSPC, UltiSnips and Tern: A config for kickass autocompletion](https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/)

## License

MIT © [Felipe Apostol](https://github.com/flipjs)
