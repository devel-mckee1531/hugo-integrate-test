#!/bin/sh

set -e

echo "Build hugo theme assets"
echo "current directory is $(pwd)"
yarn build

echo "Build static sites"
cd "${PROJECT_ROOT_DIR}"
echo "current directory is $(pwd)"
hugo
