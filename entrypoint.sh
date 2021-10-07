#!/bin/bash

set -e
set -o pipefail

if [[ -z "$GITHUB_SHA" ]]; then
  echo "Set the GITHUB_SHA environment variable."
  exit 1
fi

echo $GITHUB_SHA

echo "::set-degug name=sha::$GITHUB_SHA"

# ## 
URL="https://api.github.com/repos/${{ github.repository }}/pulls/${{ github.event.pull_request.number }}/files"
FILES=$(curl -s -X GET -G $URL | jq -r '.[] | .filename')
if echo $FILES | grep -q ".yml"; then
echo "json file changed!!"
else
echo "no json file changed!!"
fi