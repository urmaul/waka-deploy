#!/bin/bash

dir=$(dirname $0)

. $dir/common.sh

failed=0

sh $dir/check-clean.sh || failed=1

echo "Checking for unmerged code...";
txt=$(grep --exclude-dir=runtime --exclude="check-valid.sh" -rn "<<<<" $appdir)
test -z "$txt" || { echo -e "\n! Error: unmerged code found:\n$txt" ; failed=1; }

echo "Checking for PHP syntax errors...";
txt=$(find $appdir -name "*.php" | grep -v -f $dir/ignore | while read file; do php -l $file 2>&1; done | grep -v "No syntax errors detected")
test -z "$txt" || { echo -e "\n! Error: application has PHP syntax errors:\n$txt" ; failed=1; }

test $failed -eq 0 || exit 1
