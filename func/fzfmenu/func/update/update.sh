#! /bin/bash


git clone https://github.com/SkeiTax/fzfmenu.git --depth 1 $pwd/tmp
$pwd/tmp/install.sh
rm -rf ./tmp
