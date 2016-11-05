#!/bin/sh

# fetching all git sub modules
git submodule update --init --recursive

# install ctags for tagbar
brew install ctags

# build c environment
brew install \
	cscope \
	clang

# build golang environment
brew install golang
GOPATH="~/.GOPATH"
PATH="$PATH:$GOPATH/bin"
mkdir -p $GOPATH
vim	\
	-c 'GoInstallBinaries' \
	-c 'qa'

# build haskell environment
brew install haskell-stack
PATH="$PATH:$HOME/.local/bin"
stack setup
stack install \
	ghc-mod \
	hdevtools
( \
	cd bundle/lushtags && \
	stack setup && \
	stack build && \
	stack install \
)

# build ocaml environment (drafts)
brew install ocaml opam
opam init
opam install merlin

# build rust environment (TODO)
brew install rust

# link .vimrc and .gvimrc
ln -s .vim/_vimrc ~/.vimrc
ln -s .vim/_gvimrc ~/.gvimrc
