#!/bin/bash

echo "Checking for unstaged changes...";
txt=$(git diff --name-only HEAD)
test -z "$txt" || { echo -e "\n! Error: directory has unstaged changes:\n$txt"; exit 1; }
