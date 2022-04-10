# Internal variables.
SHELL := /bin/bash
MAKEFLAGS := --silent --no-print-directory

.DEFAULT_GOAL := help

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z\._-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Builds the docker images E.g.: make build args="--no-cache php"
	docker-compose build $(args)

up: ## Up all available containers
	docker-compose up -d

down: ## Down all containers
	docker-compose down

sh: ## Open a shell into the server
	docker-compose exec server bash

console: ## Execute symfony commands (e.g. make console args="migrations:migrate")
	docker-compose exec server bin/console ${args}

symfony: ## Execute symfony commands (e.g. make console args="new --dir=app --no-git")
	docker-compose exec server symfony ${args}
