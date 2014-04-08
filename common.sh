#!/bin/bash

appdir=./protected
logfile=$appdir/runtime/update.log

printerror() {
	format='\n! Error: %s\n%s'
	printf "$format" "$1" "$2"
}

logstr() {
    echo "`date "+%Y.%m.%d %H:%M"` - $@" | tee -a $logfile
}
