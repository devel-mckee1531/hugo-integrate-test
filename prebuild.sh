#!/bin/sh

set -ux

printenv

echo "current directory is $(pwd)"
if [ -z "$HUGO_BASE_URL" ]; then
  HUGO_BASE_URL="https://${AWS_BRANCH}.${AWS_APP_ID}.amplifyapp.com/"
fi

set -eux

echo "Setup hugo config"

echo "Install hugo theme assets' dependencies"

cd themes/techblog
echo "current directory is $(pwd)"
yarn install
