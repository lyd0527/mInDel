#!/bin/sh -eu
 
#  Setting envionment variables for non-root user.
#  Created by Yuanda Lv on 04/23/15.
#  Lyd0527@jaas.ac.cn
 
mkdir -p $HOME/bin
echo "export PATH=$PATH:$HOME/bin">>~/.bashrc
source ~/.bashrc
chmod a+x bin/*
cp -f bin/* $HOME/bin
