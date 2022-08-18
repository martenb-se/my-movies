#!/bin/bash
# ~~~~~~~ Get Environment
source env.load.sh

# ~~~~~~~ Constants
# Build
DOCKER_CONTAINER_DB=my-movies-db
DOCKER_CONTAINER_API=my-movies-api
DOCKER_CONTAINER_CLIENT=my-movies-client

# ~~~~~~~ Execution
# Stop containers
result_docker_stop=$(docker container stop "$DOCKER_CONTAINER_DB" 2>&1)
exit_docker_stop=$?
if [ ! $exit_docker_stop -eq 0 ]; then
  if [[ ! "$result_docker_stop" =~ .*"No such container".* ]]; then
    echo "Could not stop '$DOCKER_CONTAINER_DB' because of an unknown error: '$result_docker_stop'. Cannot continue"
    exit 1
  fi
fi

result_docker_stop=$(docker container stop "$DOCKER_CONTAINER_API" 2>&1)
exit_docker_stop=$?
if [ ! $exit_docker_stop -eq 0 ]; then
  if [[ ! "$result_docker_stop" =~ .*"No such container".* ]]; then
    echo "Could not stop '$DOCKER_CONTAINER_API' because of an unknown error: '$result_docker_stop'. Cannot continue"
    exit 1
  fi
fi

result_docker_stop=$(docker container stop "$DOCKER_CONTAINER_CLIENT" 2>&1)
exit_docker_stop=$?
if [ ! $exit_docker_stop -eq 0 ]; then
  if [[ ! "$result_docker_stop" =~ .*"No such container".* ]]; then
    echo "Could not stop '$DOCKER_CONTAINER_CLIENT' because of an unknown error: '$result_docker_stop'. Cannot continue"
    exit 1
  fi
fi

# Remove containers
result_docker_rm=$(docker container rm "$DOCKER_CONTAINER_DB" 2>&1)
exit_docker_rm=$?
if [ ! $exit_docker_rm -eq 0 ]; then
  if [[ ! "$result_docker_rm" =~ .*"No such container".* ]]; then
    echo "Could not remove '$DOCKER_CONTAINER_DB'! Cannot continue"
    exit 1
  fi
fi

result_docker_rm=$(docker container rm "$DOCKER_CONTAINER_API" 2>&1)
exit_docker_rm=$?
if [ ! $exit_docker_rm -eq 0 ]; then
  if [[ ! "$result_docker_rm" =~ .*"No such container".* ]]; then
    echo "Could not remove '$DOCKER_CONTAINER_API'! Cannot continue"
    exit 1
  fi
fi

result_docker_rm=$(docker container rm "$DOCKER_CONTAINER_CLIENT" 2>&1)
exit_docker_rm=$?
if [ ! $exit_docker_rm -eq 0 ]; then
  if [[ ! "$result_docker_rm" =~ .*"No such container".* ]]; then
    echo "Could not remove '$DOCKER_CONTAINER_CLIENT'! Cannot continue"
    exit 1
  fi
fi

# Remove images
result_docker_rm=$(docker image rm "vuejs/my-movies-client" 2>&1)
exit_docker_rm=$?
if [ ! $exit_docker_rm -eq 0 ]; then
  if [[ ! "$result_docker_rm" =~ .*"No such image".* ]]; then
    echo "Could not remove '$DOCKER_CONTAINER'! Cannot continue"
    exit 1
  fi
fi

result_docker_rm=$(docker image rm "springio/my-movies-api" 2>&1)
exit_docker_rm=$?
if [ ! $exit_docker_rm -eq 0 ]; then
  if [[ ! "$result_docker_rm" =~ .*"No such image".* ]]; then
    echo "Could not remove '$DOCKER_CONTAINER'! Cannot continue"
    exit 1
  fi
fi

