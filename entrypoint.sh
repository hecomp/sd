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
# URL="https://api.github.com/repos/${GITHUB_REPO}/pulls/${GITHUB_EVENT_PR_NUMER}/files"
# FILES=$(curl -s -X GET -G $URL | jq -r '.[] | .filename')
# if echo $FILES | grep -q ".yml"; then
# echo "yml file changed!!"
# else
# echo "no yml file changed!!"
# fi

# Do not proceed if there are no file differences, this avoids PRs with just a merge commit and no content
# LINES_CHANGED=$(git diff --name-only "$DESTINATION_BRANCH" "$SOURCE_BRANCH" -- | wc -l | awk '{print $1}')
# if [[ "$LINES_CHANGED" = "0" ]] && [[ ! "$INPUT_PR_ALLOW_EMPTY" ==  "true" ]]; then
#   echo "No file changes detected between source and destination branches."
#   exit 0
# fi

# echo "::set-degug name=lines_changed::$LINES_CHANGED"