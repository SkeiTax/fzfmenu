#! /bin/bash

fmwd=${fmwd:-"$HOME/.local/bin/fzfmenu"}

opt='
  --height 40%
  --min-height 15
  --layout=reverse 
  --border 
  --preview-window="right:70%" 
  --preview-label=info 
  --preview-label-pos=5
'

export FZF_DEFAULT_OPTS=$opt" --prompt=\"$cmd\""

_fmwd=$fmwd

ret=2

while [[ $ret = 2 ]]; do
  fmwd=$_fmwd
  export cmd=$(ls -a "$fmwd/func/" | grep -vP "(^\.$)|(^\.\w)" | fzf \
    --preview="bat --color=always -p $fmwd/func/{}/desc.md 2> /dev/null || \
      bat --color=always -p $fmwd/desc.md"
    ) || exit 0
  if [[ $cmd = .. ]]; then exit 2; fi

  export FZF_DEFAULT_OPTS=$opt" --prompt=\"$comand \""
  export fmwd="$fmwd/func/$cmd"

  if [[ -z "${cmd}" ]]; then exit 0; fi

  $fmwd/${cmd}.sh
  ret=$?
done
