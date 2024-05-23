#! /bin/bash

echo Enter dirname
read dirname
if [[ -z $dirname ]]; then exit 0; fi
mkdir "${dirname[@]}"
