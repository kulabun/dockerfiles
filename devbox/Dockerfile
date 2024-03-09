FROM ghcr.io/kulabun/brew-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="Personal development environment" \
      maintainer="konstantin.labun@gmail.com"

RUN brew install fish starship fzf ripgrep \
  git \
  just \
  helix \
  gh \
  lazygit \
  pyright ruff black \
  rust-analyzer \
  ansible-language-server \
  terraform-ls \
  bash-language-server \
  vscode-langservers-extracted \
  typescript-language-server \
  dockerfile-language-server \
  taplo \
  yaml-language-server

RUN command -v fish | sudo tee -a /etc/shells \
    && sudo chsh -s "$(command -v zsh)" "${USER}" \
    && starship init fish >> $XDG_CONFIG_HOME/fish/config.fish
