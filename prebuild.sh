#!/bin/sh

set -eux

echo "HOME is $HOME"
echo "Setup hugo config"

echo "current directory is $(pwd)"
if [ -z "$HUGO_BASE_URL" ]; then
  HUGO_BASE_URL="https://${AWS_BRANCH}.${AWS_APP_ID}.amplifyapp.com/"
fi

echo "Install hugo theme assets' dependencies"

cd themes/techblog
echo "current directory is $(pwd)"
yarn install
