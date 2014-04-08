#!/bin/bash

if [ "$#" -ne 2 ]
then
  echo "Usage: run.sh user@hostname path"
  exit 1
fi

dir=$(dirname $0)

. $dir/common.sh

sh $dir/check-valid.sh || exit 1

ssh $1 "
cd $2
sh $appdir/deploy/update.sh
"
