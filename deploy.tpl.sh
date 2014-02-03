#!/bin/bash

dir=$(dirname $0)

sh $dir/check-valid.sh || exit 1

ssh user@serv "
cd /path/to/app/
sh ./protected/deploy/remote-update.sh
"
