#!/bin/bash

dir=$(dirname $0)

. $dir/common.sh

failed=0

echo "Checking for unstaged changes...";
txt=$(git diff --name-only HEAD)
test -z "$txt" || { printerror "directory has unstaged changes:" "$txt" ; failed=1; }

test -d "$appdir" || { printerror "application directory $appdir not found." "" ; exit 1; }

echo "Checking for unmerged code...";
txt=$(grep --exclude-dir=runtime --exclude="check-valid.sh" -rn "<<<<" $appdir)
test -z "$txt" || { printerror "unmerged code found:" "$txt" ; failed=1; }

echo "Checking for PHP syntax errors...";
txt=$(find $appdir -name "*.php" | grep -v -f $dir/ignore | while read file; do php -l $file 2>&1; done | grep -v "No syntax errors detected")
test -z "$txt" || { printerror "application has PHP syntax errors:" "$txt" ; failed=1; }

test $failed -eq 0 || exit 1
