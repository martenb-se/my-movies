#!/bin/bash
# ~~~~~~~ Get Environment
source env.load.sh

# ~~~~~~~ Constants
# Build
DOCKER_CONTAINER_DB=my-movies-db
DOCKER_CONTAINER_API=my-movies-api
DOCKER_CONTAINER_CLIENT=my-movies-client

# ~~~~~~~ Execution
# Start db service detached
docker compose -f docker-compose.yml up -d --build --force-recreate

# Wait for health-check
while docker ps --all --filter "name=$DOCKER_CONTAINER_DB" --format "{{.Status}}" | grep -q "(health: starting)" ||
  docker ps --all --filter "name=$DOCKER_CONTAINER_API" --format "{{.Status}}" | grep -q "(health: starting)" ||
  docker ps --all --filter "name=$DOCKER_CONTAINER_CLIENT" --format "{{.Status}}" | grep -q "(health: starting)"; do \
  echo "Waiting for container health-checks to finish..";
  sleep 5;
done

# Was health-check successful?
container_status=$(docker ps --all --filter "name=$DOCKER_CONTAINER_DB" --format "{{.Status}}")
if echo "$container_status" | grep -q "(healthy)"; then
  echo "Docker container $DOCKER_CONTAINER_DB is now ready!"
else
  echo "Docker container $DOCKER_CONTAINER_DB does not appear to be ready.."
  echo -e "Something might be wrong. See the current status message: \n$container_status"
fi

# Was health-check successful?
container_status=$(docker ps --all --filter "name=$DOCKER_CONTAINER_API" --format "{{.Status}}")
if echo "$container_status" | grep -q "(healthy)"; then
  echo "Docker container $DOCKER_CONTAINER_API is now ready!"
else
  echo "Docker container $DOCKER_CONTAINER_API does not appear to be ready.."
  echo -e "Something might be wrong. See the current status message: \n$container_status"
fi

# Was health-check successful?
container_status=$(docker ps --all --filter "name=$DOCKER_CONTAINER_CLIENT" --format "{{.Status}}")
if echo "$container_status" | grep -q "(healthy)"; then
  echo "Docker container $DOCKER_CONTAINER_CLIENT is now ready!"
else
  echo "Docker container $DOCKER_CONTAINER_CLIENT does not appear to be ready.."
  echo -e "Something might be wrong. See the current status message: \n$container_status"
fi