
.PHONY: link unlink

link:
	ln -s $(PWD)/vim $(HOME)/.vim
	ln -s $(PWD)/vimrc $(HOME)/.vimrc

unlink:
	unlink $(HOME)/.vim
	unlink $(HOME)/.vimrc
