#!/bin/bash
SERVER=$(echo "$1" | cut -d / -f 1-3)
curl -s "$1" | tr -d '\n' | tr '<' '\n' | grep '^img' | sed 's/.*src="\([^"]*\)".*/\1/' | while read LINE
do
    if echo "$LINE" | grep '^https:' > /dev/null
    then
        curl -s -O "$LINE"
    else
        curl -s -O "$SERVER$LINE"
    fi
done
