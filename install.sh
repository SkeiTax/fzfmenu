#! /bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mv $HOME/.local/bin/fzfmenu $HOME/.local/bin/fzfmenu.bac 2> /dev/null
rm $HOME/.local/bin/fm 2> /dev/null

cd .. &> /dev/null
ln -s $SCRIPT_DIR $HOME/.local/bin/fzfmenu &&
ln -s $HOME/.local/bin/fzfmenu/fmenu.sh $HOME/.local/bin/fm
cd - &> /dev/null

echo fzfmenu installed!
