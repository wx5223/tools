# iterm2+zsh+solarized
## iterm2
[iterm2 官方下载](https://www.iterm2.com/)
	
## zsh	
[oh my zsh安装说明](https://github.com/robbyrussell/oh-my-zsh)


	$ zsh --version
	//Expected result: zsh 4.3.9 or more recent
	$ echo $SHELL
	//Expected result: /bin/zsh or similar
	
	//Make it your default shell
	$ chsh -s $(which zsh)
	//Log out and login back again to use your new default shell.
	//Test that it worked with echo $SHELL. Expected result: /bin/zsh or similar.
	
### autojump
	
	$ brew install autojump
	$ vi ~/.zshrc
	plugins=(git autojump)
	//append to file 
	[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
	//effect the .zshrc file
	$ source ~/.zshrc
	
### sublime
	$ vi ~/.zshrc
	plugins=(git autojump sublime)
	//append to file
	alias -s html=st
	alias -s java=sts
	$ source ~/.zshrc

### macdown
[官方安装地址](https://github.com/MacDownApp/macdown)

```bash
$ brew cask install macdown
$ vi ~/.zshrc
alias -s md=macdown
$ source ~/.zshrc

```

## solarized
download

	$ git clone git://github.com/altercation/solarized.git
	
### iterm2

双击运行solarized/iterm2-colors-solarized/Solarized Dark.itermcolors

iTerm→Preferences→Colors→color Presets→solarized Dark

### vim

	$ cd solarized
	$ cd vim-colors-solarized/colors
	$ mkdir -p ~/.vim/colors
	$ cp solarized.vim ~/.vim/colors/

	$ vi ~/.vimrc
	syntax enable
	set background=dark
	colorscheme solarized