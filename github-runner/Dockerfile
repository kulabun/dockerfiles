FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
  apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    sudo \
    jq \
    git \
  && rm -rf /var/lib/apt/lists/*

RUN install -m 0755 -d /etc/apt/keyrings && \
  curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
  chmod a+r /etc/apt/keyrings/docker.asc && \
  echo "Types: deb\nURIs: https://download.docker.com/linux/debian\nSuites: bookworm\nComponents: stable\nArchitectures: $(dpkg --print-architecture)\nSigned-By: /etc/apt/keyrings/docker.asc" > /etc/apt/sources.list.d/docker.sources && \
  apt-get update -y && \
  apt-get install -y --no-install-recommends \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin \
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
