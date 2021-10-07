# Base image
FROM alpine:latest

LABEL \
  "name"="Config YML Validation Action" \
  "maintainer"="Heber Silva<heber.silva@aura.com>"

# installes required packages for our script
RUN apk add --no-cache \
  bash \
  ca-certificates \
  curl \
  jq \ 
  git

# Copies your code file  repository to the filesystem
COPY entrypoint.sh /entrypoint.sh

# change permission to execute the script and
RUN chmod +x /entrypoint.sh

# file to execute when the docker container starts up
ENTRYPOINT ["/entrypoint.sh"]