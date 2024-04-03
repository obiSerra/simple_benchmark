#!/usr/bin/env bash

cmd="command time"

if [ $(which gtime) ]; then
    cmd="gtime"
fi


if [[ $# -lt 1 ]]; then
    echo "Usage: bench.sh <program>"
    exit 1
fi

$cmd -f "\nElapsed: %E \nUser: %U \nSystem: %S \nMemory: %M\n" $@