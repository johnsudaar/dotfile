#!/bin/bash

version=1.27.0

if [ -f /usr/local/bin/docker-compose ] ; then
  docker-compose --version | grep "$version" > /dev/null
  if [ $? -eq 0 ]; then
    log "Docker-compose already installed. Skipping..."
    exit 0
  fi
fi

log "Downloading docker-compose version $version"
curl -sL https://github.com/docker/compose/releases/download/$version/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

failFast $? "Fail to download docker-compose"

chmod +x /usr/local/bin/docker-compose

failFast $? "Fail to update docker-compose rights"

success "docker-compose installed."
