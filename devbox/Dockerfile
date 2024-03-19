FROM ghcr.io/kulabun/brew-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="Personal development environment" \
      maintainer="konstantin.labun@gmail.com"
      
RUN brew install fish starship fzf ripgrep \
  broot \
  trash-cli \
  git \
  just \
  helix \
  gh \
  gitui \
  pyright ruff black \
  rust-analyzer \
  ansible-language-server \
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

RUN sudo apt-get update \
  && sudo apt-get -y install wl-clipboard \
  && sudo apt-get autoremove --purge -y \
  && sudo rm -rf /var/lib/apt/lists/*

# Required to make xdg-open work
RUN sudo ln -s /usr/bin/distrobox-host-exec /usr/local/bin/xdg-open

# Setup Fish
RUN command -v fish | sudo tee -a /etc/shells
CMD ["fish"]
