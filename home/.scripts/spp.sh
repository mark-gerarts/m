#!/usr/bin/env bash

# This script will stash local changes before pulling, if there
# are any.
if [[ `git status --porcelain --untracked-files=no` ]]; then
  git stash && git pull --rebase && git stash pop
else
  git pull --rebase
fi
