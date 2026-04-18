#!/usr/bin/env bash

set -euo pipefail

# clear dist folder
mkdir -p dist
rm -rf dist/*

# build for qjsengine 
tsc -p tsconfig.json

# copy files
cp src/*.xml ./dist/
cp README.md ./dist/

# print contents
tree dist

