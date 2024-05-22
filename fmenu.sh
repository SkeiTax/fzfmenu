#! /bin/bash

pwd=${pwd:-"$HOME/.local/bin/fzfmenu"}

opt='
  --height 40%
  --layout=reverse 
  --border 
  --preview-window="right:70%" 
  --preview-label=info 
  --preview-label-pos=5
'

export FZF_DEFAULT_OPTS=$opt" --prompt=\"$command \""

export command=$(ls "$pwd/func/" | fzf \
  --preview="bat --color=always -p $pwd/func/{}/desc.md 2> /dev/null || \
    bat --color=always -p $pwd/desc.md"
  ) || exit 0


export FZF_DEFAULT_OPTS=$opt" --prompt=\"$comand \""
export pwd="$pwd/func/$command"

if [[ ! -x "$pwd/${command}.sh" ]]; then exit 0; fi

. $pwd/${command}.sh
