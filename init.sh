#!/bin/sh

git submodule update --init --recursive

cat > .gitignore << EndOfGitIgnore
/.gitignore
.DS_Store
._*
.*.swp
/.netrwhist
/_vimrc_ext
/_gvimrc_ext
EndOfGitIgnore

cat > _vimrc_ext << VimRCExt
source ~/.vim/_vimrc
VimRCExt

cat > _gvimrc_ext << GVimRCExt
source ~/.vim/_gvimrc
GVimRCExt
