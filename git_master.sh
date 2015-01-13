#!/bin/sh

for fname in `git status |  grep 'modified' | awk '{print $2}' | grep "\.p"`; do
    git add $fname
    echo "update $fname"
    git commit -m "update $fname"
    git push origin master
done

git add PYXLIST.txt README.md

