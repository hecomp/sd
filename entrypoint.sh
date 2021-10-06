#!/bin/bash

set -e
set -o pipefail

if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "Set the GITHUB_TOKEN environment variable."
  exit 1
fi

// Create GitHub client with the API token.

api_url="https://pokeapi.co/api/v2/pokemon/${INPUT_POKEMON_ID}"
echo $api_url

pokemon_name=$(curl "${api_url}" | jq ".name")
echo $pokemon_name

echo "::set-degug name=pokemon_name::$pokemon_name"