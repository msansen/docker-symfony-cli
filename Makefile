IMAGE_NAME := msansen/symfony-cli
IMAGE_TAG := latest

##
## Project
## -------
##

build:                                                    ## Builds the image
	docker build . -t ${IMAGE_NAME}:${IMAGE_TAG}

alias:                                                    ## Prints the alias required
	@echo "You can put this in your .bashrc or .bash_aliases:"
	@echo "\talias symfony='docker run --rm -it -v \`pwd\`:/application -v ~/.gitconfig:/application/.gitconfig -v ~/.composer:/application/.composer --user \`id -u\`:\`id -g\` ${IMAGE_NAME}'"

##
## Internals
## -------
##

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

.DEFAULT_GOAL := help
