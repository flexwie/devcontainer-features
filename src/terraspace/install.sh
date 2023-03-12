#!/bin/bash
if ! type gem >/dev/null 2>&1; then
  echo "ERROR: Use a base image with ruby and gem installed, add it to your Dockerfile or use a python feature like https://github.com/devcontainers/features/tree/main/src/ruby"
  exit 1
fi

if ! type ruby >/dev/null 2>&1; then
  echo "ERROR: Use a base image with ruby and gem installed, add it to your Dockerfile or use a python feature like https://github.com/devcontainers/features/tree/main/src/ruby"
  exit 1
fi

gem install terraspace