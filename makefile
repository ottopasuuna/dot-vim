
.PHONY: link unlink

link:
	ln -s $(CURDIR)/vim $(HOME)/.vim
	ln -s $(CURDIR)/vimrc $(HOME)/.vimrc

unlink:
	unlink $(HOME)/.vim
	unlink $(HOME)/.vimrc
