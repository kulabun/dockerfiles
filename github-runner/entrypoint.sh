#!/bin/bash

# Ensure required environment variables are set
if [ -z "$REPO_URL" ]; then
    echo "Error: REPO_URL environment variable must be set (e.g., https://github.com/user/repo)"
    exit 1
fi

if [ -z "$RUNNER_TOKEN" ]; then
    echo "Error: RUNNER_TOKEN environment variable must be set."
    exit 1
fi

# Determine a runner name or use the hostname
RUNNER_NAME=${RUNNER_NAME:-$(hostname)}

echo "Configuring the runner..."
./config.sh --unattended --url "$REPO_URL" --token "$RUNNER_TOKEN" --name "$RUNNER_NAME" --labels "$RUNNER_LABELS" --replace --ephemeral

# Trap SIGINT and SIGTERM to clean up the runner on container exit
cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token "$RUNNER_TOKEN"
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

echo "Starting the runner..."
./run.sh & wait $!
