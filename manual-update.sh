#!/bin/bash

dir=$(dirname $0)

. $dir/common.sh

$dir/check-clean.sh || exit 1

logstr "Manual update started at `git rev-parse HEAD`" 

sh $dir/update.sh &&
{
    sh $dir/check-valid.sh || {
        logstr "Manual update failed - rolling back";
        git reset --hard && git clean -f;
        exit 1
    }
    sh $dir/post-update.sh
}

logstr "Manual update finished at `git rev-parse HEAD`"
