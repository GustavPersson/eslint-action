#!/bin/sh

set -e

cd "${2:-.}" || echo "source root not found"

[ -f package-lock.json ] && npm install

NODE_PATH=node_modules GITHUB_TOKEN=$1 SOURCE_ROOT=${2:-.} node /action/lib/run.js

rm -rf node_modules # cleanup to prevent some wired permission errors later on
