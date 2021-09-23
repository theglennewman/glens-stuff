#!/bin/bash

echo "$0"
projdir="$HOME"
qdir="$HOME/q_win10_share"

#curproj="$projdir/gryaml"
#curproj="$qdir/learning_rust/scale_id"
curproj="$qdir/attestation"

echo -e "### move to current project: $curproj"
cd -P $curproj

echo -e "### git status..."
git status

echo -e "### and finally a cargo build..."
cargo build

echo " --> $(pwd)"
