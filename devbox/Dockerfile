FROM quay.io/toolbx-images/debian-toolbox:latest
# Switched to Debian from Ubuntu because of the cursor size issue in GUI apps running in container.

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="Personal development environment" \
      maintainer="konstantin.labun@gmail.com"

RUN sudo apt-get update \
  && sudo apt-get -y upgrade \
  && sudo apt-get -y install wl-clipboard libsecret-1-0 curl wget gpg git build-essential \
  && sudo apt-get autoremove --purge -y \
  && sudo rm -rf /var/lib/apt/lists/*


#RUN /bin/bash -c "NONINTERACTIVE=1 $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
RUN useradd -u 9876 -m -d /home/linuxbrew linuxbrew
USER linuxbrew
RUN mkdir ~/.linuxbrew ~/.linuxbrew/Homebrew && \
    git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew && \
    mkdir ~/.linuxbrew/bin && \
    ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && brew install \
  fish \
  starship \
  fzf \
  ripgrep \
  broot \
  trash-cli \
  git \
  just \
  helix \
  gh \
  gitui \
  pyright ruff black \
  rust-analyzer \
  ansible
  ansible-language-server \
  terraform \
  terraform-ls \
  bash-language-server \
  vscode-langservers-extracted \
  typescript-language-server \
  dockerfile-language-server \
  taplo \
  yaml-language-server \
  "sourcegraph/src-cli/src-cli" \
  speedtest-cli \
  zellij \
  xdg-ninja \
  awscli \
  bat \
  jq \
  chezmoi
USER root

RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg \
  && sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg \
  && sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' \
  && rm -f packages.microsoft.gpg \
  && sudo apt install -y apt-transport-https \
  && sudo apt update \
  && sudo apt install -y code \
  && sudo apt-get autoremove --purge -y \
  && sudo rm -rf /var/lib/apt/lists/*

RUN curl -L "https://data.services.jetbrains.com/products/download?platform=linux&code=IIC&latest=true&type=release" | tar xz \
  && sudo mv idea* /opt/idea \
  && chmod -R a+w /opt/idea \
  && sudo ln -sf /opt/idea/bin/idea.sh /usr/bin/idea

# Required to make xdg-open work
RUN sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/xdg-open

# Setup Fish
RUN command -v fish | sudo tee -a /etc/shells
CMD ["fish"]
