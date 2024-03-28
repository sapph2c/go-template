.PHONY: init clean bootstrap help

.DEFAULT_GOAL := help

init: clean bootstrap # Initializes the repository

bootstrap: # Sets up go development environment and cobra
	@export repo=$(basename -s .git $(git config --get remote.origin.url))
	@go mod init "github.com/$$(git config --get user.name)/$$(basename -s .git $$(git config --get remote.origin.url))"

	@go install github.com/spf13/cobra-cli@latest
	@cobra-cli init --config=.cobra.yaml


clean: # Deletes go.mod, go.sum, and cmd directories
	@rm -rf cmd/ go.mod go.sum main.go

help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done