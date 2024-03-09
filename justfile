
github-rebuild-devbox:
	gh workflow run "Build and Push Docker Image - devbox"

distrobox-rebuild-devbox:
	distrobox assemble create --file devbox/distrobox.ini

github-rebuild-brew:
	gh workflow run "Build and Push Docker Image - brew-toolbox"


