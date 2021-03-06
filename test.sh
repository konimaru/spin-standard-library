#!/bin/bash

if [ -z "$SPINC" ]
then
    SPINC="openspin"
fi

if [ "$1" == "clean" ]
then
    find . -name \*.binary -exec rm {} \;
    exit
fi

while read line
do
    ${SPINC} -L ./library "$line" >/dev/null
    if [ $? != 0 ]
    then 
        echo
        echo "${SPINC} -L . $line"
        ${SPINC} -L . "$line"
        echo
    fi
done < <(find . -name \*.spin)

