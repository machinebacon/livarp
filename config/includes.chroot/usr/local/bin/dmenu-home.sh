#!/bin/bash
# open files with rox-filer via dmenu
#####################################
loc=`ls -A $HOME | dmenu -fn "snap" -nb '#222222' -nf '#7D7D7D' -sb '#005885' -sf '#BFBFBF' -p 'goto/open/edit: '` && eval "rox $loc"
