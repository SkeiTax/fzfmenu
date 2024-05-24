#! /bin/bash

if [[ -n `whereis exa | awk '{ print $2 }'` ]]; then
  exa --icons --color=always --git-ignore -al
else
  ls --color -al
fi
exit 2
