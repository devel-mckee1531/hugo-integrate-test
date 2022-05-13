#!/bin/sh

set -e

echo "Build hugo theme assets"
cd "${PROJECT_ROOT_DIR}/themes/${HUGO_THEME}"
echo "current directory is $(pwd)"
yarn build

echo "Build static sites"
cd "${PROJECT_ROOT_DIR}"
echo "current directory is $(pwd)"
hugo
