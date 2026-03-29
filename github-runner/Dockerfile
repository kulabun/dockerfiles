FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
  apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    sudo \
    jq \
    git \
    docker.io \
    docker-compose \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m actions && \
  echo "actions ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/actions

USER actions
WORKDIR /home/actions

ENV RUNNER_VERSION=2.333.1

RUN curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
  tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && \
  rm actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

RUN sudo ./bin/installdependencies.sh

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
