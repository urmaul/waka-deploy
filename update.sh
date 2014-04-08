#!/bin/bash

dir=$(dirname $0)

. $dir/common.sh

sh $dir/check-clean.sh || exit 1

logstr "Update started at `git rev-parse HEAD`"

git pull
#sh $appdir/init.sh
php $appdir/yiic migrate up --interactive=0

logstr "Update finished at `git rev-parse HEAD`"
