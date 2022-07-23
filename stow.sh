#!/bin/bash

for dir in */
do
    dir=${dir%*/}
    echo "> Now stowing: ${dir##*/}"
    stow ${dir##*/}
done

echo "> Restoring old files"
git restore .
