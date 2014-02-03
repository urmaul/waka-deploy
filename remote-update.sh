#!/bin/bash

dir=$(dirname $0)

. $dir/common.sh

logstr "Remote update started at `git rev-parse HEAD`"

sh $dir/update.sh &&
sh $dir/post-update.sh

logstr "Remote update finished at `git rev-parse HEAD`"
