#!/bin/bash

appdir=./protected
logfile=$appdir/runtime/update.log

logstr() {
    echo "`date "+%Y.%m.%d %H:%M"` - $@" | tee -a $logfile
}
