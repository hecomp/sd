#!/bin/bash

set -e
set -o pipefail

if [[ -z "$GITHUB_SHA" ]]; then
  echo "Set the GITHUB_SHA environment variable."
  exit 1
fi

echo $GITHUB_SHA

echo "::set-degug name=sha::$GITHUB_SHA"