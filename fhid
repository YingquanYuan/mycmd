#!/bin/bash

PARAM=$1
echo $PARAM | egrep -q '^[0-9]+$'
test $? -eq 0 || eval "echo 'Args must be number!'; exit 1"
OPT=`test $PARAM -eq 0 && echo FALSE || echo TRUE`

defaults write com.apple.finder AppleShowAllFiles $OPT
killall Finder
