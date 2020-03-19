#!/usr/bin/env bash

cd ${project_name}

osascript -e 'quit app "Docker"'

echo "== Restarting docker..."
open -a Docker

while ! docker ps > /dev/null 2>&1 ; do sleep 2; done

echo ""
echo "SUCCESS! Now go run your containers "
