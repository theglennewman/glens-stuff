#!/bin/bash

# Copies various files to my glens-stuff git repo and runs git status.
#
# gnewman 2019.10.01

dstDir="${HOME}/github-projects/glens-stuff"

# source as first item, destination in git as second item
thefiles=()
thefiles+=("~/.bashrc"
