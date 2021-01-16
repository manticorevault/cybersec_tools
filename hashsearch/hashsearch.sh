#!/bin/bash

# From Cybersecurity Ops with Bash

# What is it?
# This script search a given directory for
# a file that matches a given SHA-1 hash

# How to use it?
# hashsearch.sh <HASH> <DIRECTORY>
# > HASH => SHA-1 hash from the file you wanna find
# > DIRECTORY => The directory where it will search for it

HASH=$1
DIR=${2:-.}

# A function to convert pathname into absolute path
function pathtoabs ()
{
    if [[ $1 == /* ]]
    then
        ABS=$1
    else
        ABS="$PWD/$1"
    fi
}

find $DIR -type f |
while read fn 
do 
    THISONE=$(sha1sum "$fn")
    THISONE=${THISONE%% *}
    if [[ $THISONE == $HASH ]]
    then
        pathtoabs "$fn"
        echo $ABS
    fi
done
