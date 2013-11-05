#!/bin/bash
# basic dmenu config
####################
exe=`dmenu_path | dmenu -fn "snap" -nb '#222222' -nf '#7D7D7D' -sb '#005885' -sf '#BFBFBF' -p 'exec:'` && eval "exec $exe"
