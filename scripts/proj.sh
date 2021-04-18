#!/bin/bash

echo "$0"
projdir="$HOME"
curproj="$projdir/gryaml"

echo -e "### move to current project: $curproj"
cd -P $curproj

echo -e "### git status..."
git status

echo -e "### and finally a cargo build..."
cargo build
