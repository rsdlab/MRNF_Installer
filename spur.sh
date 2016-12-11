#!/bin/bash

recho() {
    echo "\033[1;31m$1\033[m"
}


dmesg | tail

recho "Please tell me the connected port"
echo -n ">>"
read Port


sudo ypspur-coordinator -p TEC-1.param -d /dev/$Port
