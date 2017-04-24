#! /bin/bash

git add -A
git commit --amend
rm -rf public/*
hugo
cd public
git add -A
git commit --amend
git push -f origin master
