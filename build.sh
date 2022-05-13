#!/bin/sh

set -eux

echo "Build hugo theme assets"
echo "current directory is $(pwd)"
yarn build

echo "Build static sites"
cd ../..
echo "current directory is $(pwd)"
hugo
