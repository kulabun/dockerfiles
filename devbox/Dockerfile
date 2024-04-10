FROM quay.io/toolbx-images/debian-toolbox:latest
# Switched to Debian from Ubuntu because of the cursor size issue in GUI apps running in container.

LABEL com.github.containers.toolbox="true" \
  usage="This image is meant to be used with the toolbox or distrobox command" \
  summary="Personal development environment" \
  maintainer="konstantin.labun@gmail.com"

# Fix for locale error I got after updating debian image once..
RUN echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment \
      echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen \
      echo "LANG=en_US.UTF-8" | sudo tee -a /etc/locale.conf \
      sudo locale-gen en_US.UTF-8

RUN sudo apt-get update \
  && sudo apt-get -y upgrade \
  && sudo apt-get -y install wl-clipboard libsecret-1-0 curl wget gpg git build-essential \
  && sudo apt-get autoremove --purge -y \
  && sudo rm -rf /var/lib/apt/lists/*

# LinuxBrew
RUN useradd -u 1000 -m -d /home/linuxbrew linuxbrew
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
  helix \
  neovim \
  git \
  git-delta \
  gh \
  glab \
  zellij \
  bat \
  awscli \
  trash-cli \
  jq 

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && brew install \
  pyright ruff black \
  rust-analyzer \
  ansible ansible-language-server \
  terraform terraform-ls \
  bash-language-server \
  vscode-langservers-extracted \
  typescript-language-server \
  dockerfile-language-server \
  taplo \
  yaml-language-server 

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && brew install \
  broot \
  gitui \
  just \
  "sourcegraph/src-cli/src-cli" \
  speedtest-cli \
  xdg-ninja \
  chezmoi

USER root

# VSCode
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg \
  && sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg \
  && sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' \
  && rm -f packages.microsoft.gpg \
  && sudo apt install -y apt-transport-https \
  && sudo apt update \
  && sudo apt install -y code \
  && sudo apt-get autoremove --purge -y \
  && sudo rm -rf /var/lib/apt/lists/*

# JetBrains IDEA CE
RUN curl -L "https://data.services.jetbrains.com/products/download?platform=linux&code=IIC&latest=true&type=release" | tar xz \
  && sudo mv idea* /opt/idea \
  && chmod -R a+w /opt/idea \
  && sudo ln -sf /opt/idea/bin/idea.sh /usr/bin/idea \
  && cat > /usr/share/applications/jetbrains-idea-ce.desktop <<END
[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA Community Edition
Icon=/opt/idea/bin/idea.svg
Exec="/opt/idea/bin/idea.sh" %f
Comment=Capable and Ergonomic IDE for JVM
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea-ce
StartupNotify=true
END

# Google Cloud SDK
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o cloud.google.gpg \
  && sudo install -D -o root -g root -m 644 cloud.google.gpg /usr/share/keyrings/cloud.google.gpg \
  && rm -f cloud.google.gpg \
  && sudo apt-get update \
  && sudo apt-get install -y google-cloud-cli \
  && sudo apt-get autoremove --purge -y \
  && sudo rm -rf /var/lib/apt/lists/*

# Devpod
RUN curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && sudo install -c -m 0755 devpod /usr/local/bin && rm -f devpod

# Setup Fish
RUN command -v fish | sudo tee -a /etc/shells
CMD ["fish"]
