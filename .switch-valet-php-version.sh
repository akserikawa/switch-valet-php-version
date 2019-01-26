#!/bin/zsh

# switches php version
phpv() {
    string="$1" # i.e: valet-php@7.3, valet-php@5.6, etc... 
    a=("${(@s/@/)string}") # @ modifier, split string by delimiter /@/
    echo "Switching to php version => $a[2] ..."
    valet use $a[2] # get the numeric version after "@"
    valet install
}
