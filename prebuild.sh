#!/bin/sh

echo "Set environment variables"
echo "current directory is $(pwd)"
set -ex
if [ -z "$PROJECT_ROOT_DIR" ]; then
  PROJECT_ROOT_DIR="$(pwd)"
fi
if [ -z "$BUILD_ENV" ]; then
  BUILD_ENV=stg
fi

echo "Setup hugo config"
set -ex
if [ -z "$HUGO_ENV" ]; then
  HUGO_ENV="${BUILD_ENV}"
fi
if [ -z "$HUGO_THEME" ]; then
  HUGO_THEME="techblog"
fi
if [ -z "$HUGO_BASEURL" ]; then
  HUGO_BASEURL="https://${AWS_BRANCH}.${AWS_APP_ID}.amplifyapp.com/"
fi

echo "Install hugo theme assets' dependencies"
set -eux
cd "${PROJECT_ROOT_DIR}/themes/${HUGO_THEME}"
echo "current directory is $(pwd)"
yarn install
