#!/bin/bash

set -e
set -o pipefail

if [[ -z "$GITHUB_SHA" ]]; then
  echo "Set the GITHUB_SHA environment variable."
  exit 1
fi

echo $GITHUB_SHA

echo "::set-degug name=sha::$GITHUB_SHA"

pr_number=${github.event.pull_request.number}

echo "::set-degug name=pr_number::$pr_number"

# ## 
# URL="https://api.github.com/repos/${{ github.repository }}/pulls/${{ github.event.pull_request.number }}/files"
# FILES=$(curl -s -X GET -G $URL | jq -r '.[] | .filename')
# if echo $FILES | grep -q ".json"; then
# echo "json file changed!!"
# else
# echo "no json file changed!!"
# fi