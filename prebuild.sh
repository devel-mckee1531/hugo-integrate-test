#!/bin/sh

echo "Set environment variables"
echo "current directory is $(pwd)"
set -e
if [ -z "$PROJECT_ROOT_DIR" ]; then
  PROJECT_ROOT_DIR="$(pwd)"
fi
if [ -z "$BUILD_ENV" ]; then
  BUILD_ENV=stg
fi

echo "Setup hugo config"
set -e
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
set -e
cd "${PROJECT_ROOT_DIR}/themes/${HUGO_THEME}"
echo "current directory is $(pwd)"
yarn install

echo "Prebuild is suceeded"
cd "${PROJECT_ROOT_DIR}"
echo "current directory is $(pwd)"

echo "Advance to the next stage"
