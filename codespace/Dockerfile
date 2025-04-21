FROM mcr.microsoft.com/devcontainers/universal:linux

RUN pip3 install awscli

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
    # Add OpenTofu GPG key (placing it in the recommended directory)
    && curl -fsSL https://packages.opentofu.org/opentofu/tofu/gpgkey | gpg --dearmor -o /usr/share/keyrings/opentofu.gpg \
    && chmod a+r /usr/share/keyrings/opentofu.gpg \
    # Add OpenTofu repository, referencing the specific key
    && echo "deb [signed-by=/usr/share/keyrings/opentofu.gpg] https://packages.opentofu.org/opentofu/tofu/any/ any main" > /etc/apt/sources.list.d/opentofu.list \
    # Update package list and install OpenTofu
    && apt-get update \
    && apt-get install -y opentofu \
    # Clean up APT caches and lists
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://get.opentofu.org/opentofu.gpg | sudo apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://packages.opentofu.org/opentofu/tofu/any/ any main" \
    && apt-get update && sudo apt-get -y install tofu \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
    
ENV DEBIAN_FRONTEND=dialog
