#!/bin/bash

alias <func>='execute a command'
# List along with grep
lig() {
    for var in "$0"
    do
        row=echo "<loop_variable>" | grep "$var"
    done
    echo "$row"
}