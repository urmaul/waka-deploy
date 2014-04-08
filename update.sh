#!/bin/bash

dir=$(dirname $0)

. $dir/common.sh

echo "Checking for unstaged changes...";
txt=$(git diff --name-only HEAD)
test -z "$txt" || { printerror "directory has unstaged changes:" "$txt" ; exit 1; }

logstr "Update started at `git rev-parse HEAD`"

git pull
sh $dir/post-update.sh

logstr "Update finished at `git rev-parse HEAD`"
