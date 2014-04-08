#!/bin/bash

dir=$(dirname $0)

. $dir/common.sh

sh $dir/check-clean.sh || exit 1

logstr "Update started at `git rev-parse HEAD`"

git pull
sh $dir/post-update.sh

logstr "Update finished at `git rev-parse HEAD`"
