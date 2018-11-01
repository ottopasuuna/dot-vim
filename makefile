
.PHONY: install uninstall link unlink

install: unlink link
	vim '+PlugInstall' '+qa'

uninstall: unlink

link:
	- ln -s $(CURDIR)/vim $(HOME)/.vim
	- ln -s $(CURDIR)/vimrc $(HOME)/.vimrc

unlink:
	- unlink $(HOME)/.vim
	- unlink $(HOME)/.vimrc
